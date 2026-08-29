# AGENTS.md

多设备的个人 NixOS 配置，命名为 **funkcia**.

## 项目结构

see README.md

## 使用现代化的 cli 工具和脚本

该系统已经配置了使用更现代的 CLI 工具，包括 `fd`, `fzf`, `rg`, `eza`, `bat`, `nushell` 等。
可选地，可以使用这些现代化的 CLI 工具来完成各种搜索、替换等需求。

推荐使用 javascript 和 python 进行脚本处理，优先使用 javascript 和 bun 运行时。
该系统没有 system-wide python，使用 `uv run <script>.py` 运行 python 脚本。
该系统 system-wide nodejs 版本很高，在新版本 nodejs 中，typescript 可以直接被运行。
使用 bun 和 nodejs 可以无需 `tsc` 对 typescript 脚本运行。

## 如何添加、修改一个系统功能

0. 确定当前机器。使用 hostname 确定当前机器名。

1. 确定模块范围。判断这属于哪一层配置：device-specific（`devices/name/`）、user-specific（`home/name/`）、
还是全局（home-manager → `home/modules/`，nixos → `modules/`）。

若改动全局共享模块，会影响所有设备，先向用户确认影响面；若只涉及 `devices/name/` 或 `home/name/`，可直接进行。

2. 先搜索是否有现成模块。在项目本地使用 `rg` 搜索现成模块，如果有共用模块，思考对它修改会造成多少影响，
造成的影响是否是可以在所有机器上都变化的。

3. 引入包、选项、模块之前，先搜索。

**不要自己造轮子**

如果是 home-manager 模块，使用 `nh search options {keyword} --scope=home-manager` 搜索 home manager 选项
如果是 nixos 模块，使用 `nh search options {keyword} --scope=nixpkgs` 搜索 nixos 选项。
如果都没有搜索到，最后尝试 `nh search packages {keyword}` 搜索包名

能用 options 打开的，不要用添加包的方式打开。能复用现成 options 的，不要自己造轮子。

## 特殊的 funkcia-utils

定义在 `utils/files.nix` 文件夹下的 funkcia-utils.files 帮助实现按文件名的自动导入。例如

```nix
imports = [
    (funkcia-utils.files.mkDirModule ./programs)
    (funkcia-utils.files.mkIndexDirModule "index.nix" ./programs)
    (funkcia-utils.files.mkRecDirModule ./modules)
]
```

`mkDirModule`: ./programs 顶层（不包括子文件夹）下的所有 .nix 文件都被导入
`mkIndexDirModule` ./programs （递归地包括子文件夹）下的所有 index.nix 文件都被导入
`mkRecDirModule` ./modules （递归地包括子文件夹）下的所有 .nix 文件都被导入

## 构建和测试

在下文中，"device-name" means the device name to switch. for example, "legion-82tf"。

使用

```bash
nh os build .#device-name -o result-{device-name}
```

构建。对于本机，额外使用

```bash
nvd diff result-{device-name} /run/current-system
```

计算差异，防止配置更改产生不必要的变化。