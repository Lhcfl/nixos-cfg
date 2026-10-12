---
description: Linca 的用户配置
---

# Linca 的用户配置

## 路径约定

- [`home.nix`](home.nix) 入口文件，声明 home 基础设置（用户名、shell、包列表），
  并 imports 其余所有模块
- [`modules/`](modules/) 按功能划分的用户级 HM 模块
  （`gui`、`play`、`work`、`sops`、`ricing`），由 `home.nix` 递归自动导入
- [`gui/`](gui/) GUI 程序模块，由 [`modules/gui.nix`](modules/gui.nix) 递归自动
  引入；每个文件自行用 `funkcia.hm.gui.enable` 守护
- [`programs/`](programs/) 按程序划分的 HM 配置，由 `home.nix` 自动导入
  （`mkDirModule` + `mkDirModule`）
- [`xdg.nix`](xdg.nix) + [`xdg/`](xdg/) XDG 配置（mime 默认应用、`config/` 下的
  配置链接）
- [`assets/`](assets/) 静态资源（如 avatar）
- [`sync/`](sync/) 由 [`sync.ts`](sync/sync.ts) 创建运行时软链接的可编辑配置
  （`Config/` → `~/.config/`，`State/` → `~/.local/state/`）

## 说明

- GUI 相关的程序统一放在 [`gui/`](gui/) 而不是 `programs/`，由
  [`modules/gui.nix`](modules/gui.nix) 通过 `filesystem-modules.mkModule` 递归引
  入。每个文件自己负责开关：program 的 `enable` 绑定
  `config.funkcia.hm.gui.enable`，跨子系统贡献
  （`funkcia.hm.gui.niri.settings`、`funkcia.hm.gui.umbriel.settings`、`funkcia.hm.gui.noctalia.*`
  等）用目标模块的 enable 通过 `lib.mkIf` 守护，不再有统一的 `patchModule` 魔
  法。
