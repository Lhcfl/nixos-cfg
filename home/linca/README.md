# Linca 的用户配置

## 路径约定

- [`home.nix`](home.nix) 入口文件，声明 home 基础设置（用户名、shell、包列表），并 imports 其余所有模块
- [`modules/`](modules/) 按功能划分的用户级 HM 模块（`gui`、`play`、`work`、`sops`、`ricing`），由 `home.nix` 递归自动导入
- [`gui/`](gui/) GUI 程序模块，由 [`modules/gui.nix`](modules/gui.nix) 自动引入，并统一包裹 `funkcia.hm.gui.enable` 条件
- [`programs/`](programs/) 按程序划分的 HM 配置，由 `home.nix` 自动导入（`mkDirModule` + `mkDirModule`）
- [`xdg.nix`](xdg.nix) + [`xdg/`](xdg/) XDG 配置（mime 默认应用、`config/` 下的配置链接）
- [`assets/`](assets/) 静态资源（如 avatar）
- [`sync/`](sync/) 由 [`sync.ts`](sync/sync.ts) 创建运行时软链接的可编辑配置（`Config/` → `~/.config/`，`State/` → `~/.local/state/`）

## 说明

- `home.nix` 在 `programs` 下同时使用 `mkDirModule`（顶层 `.nix`）与 `mkDirModule`（递归的 `default.nix`，如 [`programs/nushell/`](programs/nushell/)），对 `modules/` 则使用 `mkRecDirModule` 递归导入全部 `.nix`。
- 部分模块通过 `linca.*.enable` 开关控制（如 `linca.play`、`linca.work`、`linca.sops`），可参考每个模块顶部的 `lib.mkEnableOption`。
- GUI 相关的程序统一放在 [`gui/`](gui/) 而不是 `programs/`，由 `modules/gui.nix` 的 `funkcia-utils.magic.patchModule` 批量加上 `mkIf cfg.enable` 条件。
