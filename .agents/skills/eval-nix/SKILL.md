---
name: eval-nix
description: 在不构建整个系统的前提下，求值、检查与隔离测试 NixOS / home-manager / Nix 模块的选项值。
---

# 求值与测试 Nix 模块选项

用于回答：“这个选项最终值是什么？”“我改的模块会不会生效？”“为什么求值报错？”

## 0. 前提

1. flake 只读取 git 已跟踪的文件：新增文件必须先 `git add`（无需 commit）。
2. 确定设备名：`hostname`。在该仓库下，设备名总是与 hostname 一致。

下文用 `HOST` 表示设备名，`USER` 表示用户名。

## 1. 先查选项是否存在、定义在哪

```bash
nh search options <keyword> --scope=nixpkgs        # NixOS 选项
nh search options <keyword> --scope=home-manager   # home-manager 选项
nh search packages <keyword>                       # 兜底找包
```

不要靠猜选项名。

## 2. 看**当前运行系统**的生效值（若该命令可用）：

以 `boot.loader.systemd-boot.enable` 为例：

```bash
nixos-option boot.loader.systemd-boot.enable
```

## 3. 求值 flake 里的选项

```bash
# 单值
nix eval .#nixosConfigurations.HOST.config.boot.loader.systemd-boot.enable

# JSON（结构体/列表）
nix eval --json .#nixosConfigurations.HOST.config.networking.firewall.allowedTCPPorts | jq .

# 字符串用 --raw
nix eval --raw .#nixosConfigurations.HOST.config.networking.hostName
```

home-manager 选项挂在 nixosConfigurations 下：

```bash
nix eval --json .#nixosConfigurations.HOST.config.home-manager.users.USER.programs.fzf.enable
```

批量检查属性名，避免把巨大 derivation 拉到本地：

```bash
nix eval --json .#nixosConfigurations.HOST.config.systemd.services \
  --apply builtins.attrNames | jq .

nix eval --json .#nixosConfigurations.HOST.config.environment.systemPackages \
  --apply 'ps: map (p: p.pname or p.name) ps' | jq -r '.[]' | sort
```

## 4. 隔离测试单个模块（不加载整机配置）

在 srcipts/test-module 下有现成的脚本帮助做隔离测试。例如，如果 `/tmp/example.nix` 内容如下：

```nix
{ lib, ... }: {
  options.a = lib.mkEnableOption "foo";
  config.a = true;
}
```

```bash
nu scripts/test-module/app.nu /tmp/example.nix
```

得到的结果是

```
{ a = true; }
```

## 6. 调试求值错误

```bash
nix eval ... --show-trace
nix eval ... 2>&1 | less
```

模块里临时插桩：

```nix
lib.debug.traceVal config.some.thing
builtins.trace "some.thing = ${toString config.some.thing}" config.some.thing
```

常见错误：

- `attribute 'x' missing`：选项未定义或层级写错 —— 回到第 1 节搜索。
- `The option 'x' is used but not defined`：忘了 import 定义它的模块。
- `infinite recursion`：`config.x` 依赖自身；改用 `options` / `mkIf` / `lib.mkDefault`。
- `value is a function`：`--json` 遇到函数；用 `--apply` 先取字段，或改用 `nix repl`。

## 7. 陷阱清单

- flake 求值只看 git 索引：新文件没 `git add` 等于不存在。
- `config` 是惰性 thunk：只 check 一个属性，不代表整棵配置求值通过。
- `nixos-option` 默认看**当前运行的系统**，不是 flake 里的新配置。
- 涉及 `builtins.currentSystem`、secrets、环境变量时需 `--impure`。
- `--json` 无法序列化 derivation / 函数；用 `--apply` 或 `--raw` 变通。