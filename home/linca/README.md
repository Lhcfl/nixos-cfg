# Linca 的用户配置

## 路径约定

- [`home.nix`](home.nix) 入口文件，imports 其余所有模块
- [`packages.nix`](packages.nix) 用户级包列表
- [`assets/`](assets/) 静态资源（如 avatar）
- [`gui.nix`](gui.nix) 带条件 (`funkcia.hm.gui.enable`) 的 GUI 配置；自动引入 [`programs/gui/`](programs/gui/) 下的模块并包裹 `mkIf`
- [`programs/`](programs/) 按程序划分的 HM 配置，由 `home.nix` 自动导入（`listNixFiles`）
- [`ricing.nix`](ricing.nix) 引入 [`ricing/`](ricing/) 下的外观模块
- [`shell.nix`](shell.nix) Shell 配置
- [`sync/Config/`](sync/Config/) 可编辑的配置文件，由 `sync.ts` 创建运行时软链接到 `~/.config/`
- [`wine.nix`](wine.nix) Wine 配置
- [`xdg.nix`](xdg.nix) XDG 配置