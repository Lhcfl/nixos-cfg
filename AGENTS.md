# AGENTS.md

多设备的个人 NixOS 配置，命名为 **funkcia**.

## 项目结构

see README.md

## 使用现代化的 cli 工具和脚本

该系统已经配置了使用更现代的 CLI 工具，包括 `fd`, `fzf`, `rg`, `eza`, `bat`,
`nushell` 等。可选地，可以使用这些现代化的 CLI 工具来完成各种搜索、替换等需求。

推荐使用 javascript 和 python 进行脚本处理，优先使用 javascript 和 bun 运行时。
该系统没有 system-wide python，使用 `uv run <script>.py` 运行 python 脚本。该系
统 system-wide nodejs 版本很高，在新版本 nodejs 中，typescript 可以直接被运行。
使用 bun 和 nodejs 可以无需 `tsc` 对 typescript 脚本运行。

## 如何添加、修改一个系统功能

在该项目中，当用户说“帮我安装”的时候，默认指的是用 Nix 的方式安装，应该先在本地
和互联网上搜索是否有 Nix 的解决方案。如果没有，再询问用户如何解决。对于有 Nix 的
解决方案，应当：

0. 确定当前机器。使用 hostname 确定当前机器名。

1. 确定模块范围。判断这属于哪一层配
   置：device-specific（`devices/name/`）、user-specific（`home/name/`）、还是全
   局（home-manager → `home/modules/`，nixos → `modules/`）。

若改动全局共享模块，会影响所有设备，先向用户确认影响面；若只涉及 `devices/name/`
或 `home/name/`，可直接进行。

2. 先搜索是否有现成模块。在项目本地使用 `rg` 搜索现成模块，如果有共用模块，思考
   对它修改会造成多少影响，造成的影响是否是可以在所有机器上都变化的。

3. 引入包、选项、模块之前，先搜索。

**不要自己造轮子**

- 如果是 home-manager 模块，使用 `nh search options {keyword}
  --scope=home-manager` 搜索 home manager 选项。
- 如果是 nixos 模块，使用 `nh search options {keyword} --scope=nixpkgs` 搜索
  nixos 选项。
- 如果都没有搜索到，最后尝试 `nh search packages {keyword}` 搜索包名

能用 options 打开的，不要用添加包的方式打开。能复用现成 options 的，不要自己造轮
子。

## 特殊的 funkcia-utils

定义在 `utils/files.nix` 文件夹下的 funkcia-utils.files 帮助实现按文件名的自动导
入。例如

```nix
imports = [
    (funkcia-utils.files.mkDirModule ./programs)
    (funkcia-utils.files.mkDirModule ./programs)
    (funkcia-utils.files.mkRecDirModule ./modules)
]
```

`mkDirModule`: ./programs 顶层（不包括子文件夹）下的所有 .nix 文件都被导入
`mkRecDirModule` ./modules （递归地包括子文件夹）下的所有 .nix 文件都被导入

## 构建和测试

重要：在构建和测试前，由于 flake 的特性，必须 `git add` 新增的文件，否则文件不生
效。

在下文中，"device-name" means the device name to switch. for example,
"legion-82tf"。

使用

```bash
nh os build .#device-name -o result-{device-name}
```

构建。对于本机，额外使用

```bash
nvd diff result-{device-name} /run/current-system
```

计算差异，防止配置更改产生不必要的变化。

如果用户需要 switch 系统，使用 `nh os switch --elevation-strategy
/run/current-system/sw/bin/run0` 使用 run0 提权。

## Commit 格式规范

- 作为 NixOS 配置仓库，传统的 `feat` `refactor` 之类的 type 没有意义，不些
- 使用 `part (scope): subject` 作为格式
- part 是改动的哪个部位。下面列出一些例子：
  - 改动 device/legion-82tf 时，part 是 legion-82tf
  - 改动 device/legion-82tf/home/linca 时，part 是 legion-82tf/linca
  - 改动 packages/commit 时，part 是 package
  - 改动 parts/doc 时，part 是 parts
- 最前面加一个与改动最贴切的 emoji，后接一个空格
- subject 的语言与改动内容保持一致，不超过 72 个字符
- 确有需要时，空一行后补充正文

例如：`✨ package (commit): 生成带 emoji 前缀的 commit message`

## 安全须知

用户的 `secrets.yaml` 等被 sops 引用的文件内包含敏感的 token 等内容，**永远不要
擅自操作**，无论是解密还是修改。不要尝试在用户的 shell 记录内查找敏感内容。将这
些工作交给用户自己完成。
