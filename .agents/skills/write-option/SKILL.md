---
name: write-option
description: Guides creating a NixOS / Home Manager `mkOption` by reusing existing nixpkgs types, formats, and generators instead of inventing new ones. Use when writing a module option, a `settings`/config option for a program or service, or any time you are about to write `lib.mkOption`.
---

# Write Option

写 option 的目的，是让**同一份配置被多处复用**。所以先判断该不该写，再照仓库既有
风格去写，最后求值验证。

## 1. 先确认必要性

- 只有当同一份配置**明确至少有两处复用**（两台设备、两个用户，或同一模块内两份重复
  配置）时，才值得抽成 option。
- 只有一处使用 → **不要**写 option，直接写在该设备的 `configuration.nix` 或用户的
  `home.nix` 里。

命名空间见 `AGENTS.md`：`funkcia.os.*`（NixOS 范围）、`funkcia.hm.*`（Home Manager
范围）、用户级用 `<username>.*`。

## 2. 读现有 module，照它的风格写

不要凭空设计。先找到同类模块，跟着它的写法来：

```bash
rg -l 'mkEnableOption|mkOption' modules home --type nix
rg -n 'funkcia\.(os|hm)\.' modules home --type nix | head
```

可参考的范本：

- NixOS 开关：`modules/btrbk.nix`、`modules/flatpak.nix`、`modules/gui/default.nix`
- Home Manager 开关（`enable` 默认跟随 `osConfig`）：
  `home/modules/gui/gui.nix`、`home/modules/gui/umbriel.nix`
- 结构化 `settings`（配 `pkgs.formats`）：`home/modules/gui/noctalia.nix`
- 子模块 / 自由格式：`home/modules/programs/pi.nix`、`modules/user.nix`
- 用户级开关：`home/linca/modules/work.nix`

骨架与风格：

```nix
{ config, lib, ... }:
let
  cfg = config.funkcia.os.xxx;          # 或 config.funkcia.hm.xxx / config.<username>.xxx
in
{
  options.funkcia.os.xxx = {
    enable = lib.mkEnableOption "一句话说明这个开关做什么";
  };

  config = lib.mkIf cfg.enable {
    # ...
  };
}
```

- `enable` 用 `lib.mkEnableOption`；需要默认跟随上游时用
  `lib.mkEnableOption "..." // { default = osConfig... or false; defaultText = lib.literalExpression "..."; }`。
- `description` 写清楚用途；能给出 `example` 就给。

## 3. 确认 option 的类型，不要造轮子

先搜有没有现成的选项，再决定类型：

```bash
nh search options {keyword} --scope=home-manager   # 或 --scope=nixpkgs
```

类型选择（优先用最具体的，`anything` / 裸 `str` 是最后手段）：

- 程序的结构化配置 → `pkgs.formats.<fmt> { }.type`，并配 `.generate` 一起用，例如
  `inherit (toml) type;`（见 `noctalia.nix`）。现有格式：`json`、`toml`、`yaml`、
  `yaml_1_1`、`yaml_1_2`、`ini`、`iniWithGlobalSection`、`gitIni`、`nixConf`。
- KDL → 用 `inputs.nix-kdl.kdl` 的 `kdl.formats.v1 [ ... ]`，**不是** `lib.types.lines`。
- 需要跨模块拼接的纯文本 → `lib.types.lines`（仅此场景）。
- 开关 → `lib.mkEnableOption`；标量 → `lib.types.{str,int,bool,port,path,…}`。
- 自定义结构 → `lib.types.attrsOf (lib.types.submodule { … })`，需要透传额外键时加
  `freeformType = lib.types.attrsOf lib.types.anything;`。

库函数 / 类型拿不准时，用 noogle 查（配合 agent-browser）：

```bash
agent-browser open 'https://noogle.dev/q/?term=submodule' \
  && agent-browser wait 2000 \
  && agent-browser get text body
```

## 4. 用 test-module 求值验证

写完用仓库自带的隔离求值脚本确认它能求值、类型能生效：

```bash
nu scripts/test-module/app.nu /tmp/example.nix
```

harness 只注入 `pkgs` 和 `lib`，所以：

- 只依赖 `pkgs`/`lib` 的模块，直接把模块写进 `/tmp/example.nix` 就能测。
- 依赖 `osConfig`、`inputs` 或别的模块选项时，在**同一个输入文件**里用 `imports` 拼
  上「目标模块 + 最小 stub + 用例」。注意：一个 module 里一旦出现 `options`，就不能
  在顶层再放 `_module` 之类的属性，`_module.args` 必须单独放一个 module。

已实测可用的例子：

```nix
{
  imports = [
    (_: {
      _module.args.osConfig = {
        programs.umbriel.enable = true;
      };
    })
    ({ lib, ... }: {
      options.xdg.configFile = lib.mkOption {
        type = lib.types.attrsOf lib.types.anything;
        default = { };
      };
      options.services.polkit-gnome.enable = lib.mkEnableOption "polkit gnome";
    })
    ./home/modules/gui/umbriel.nix
    {
      funkcia.hm.gui.umbriel.settings.general.autostart = [ "noctalia" ];
    }
  ];
}
```

不要用 `nix eval --expr` 手搓求值——容易写错，也没有必要。

## Checklist

- [ ] 至少两处复用才写 option；只有一处就直接写在设备/用户配置里。
- [ ] 照着同类现有 module 的风格写（`options.` + `lib.mkIf cfg.enable`）。
- [ ] 搜过现成的 option 与类型，没有再自己定义。
- [ ] 用 `nu scripts/test-module/app.nu` 求值通过。
