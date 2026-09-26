# NixOS Configurations

存放各种 NixOS 系统配置文件的仓库。

[🔍️ Search Options](https://lhcfl.github.io/nixos-cfg)
[📖️ Options Documentation](docs.md)

## 路径约定

<!-- dprint-ignore-start -->
<!-- BEGIN_GEN_README_TREE -->

| # |                   path                    |                                  description                                  |
|---|-------------------------------------------|-------------------------------------------------------------------------------|
| 0 | [`devices/`](devices/README.md)           | 存放设备特定的 nix 配置                                                       |
| 1 | [`fixes/`](fixes/README.md)               | 存放对所有设备、用户生效的“修复”。一般存放上游包有错误的时候，`overrideAttrs` |
| 2 | [`home/`](home/README.md)                 | Home Manager 用户和模块定义                                                   |
| 3 | [`home/linca/`](home/linca/README.md)     | Linca 的用户配置                                                              |
| 4 | [`home/modules/`](home/modules/README.md) | 对所有用户生效的 Home Manager 模块                                            |
| 5 | [`nixos/`](nixos/README.md)               | 所有设备都可使用的 NixOS module                                               |
| 6 | [`packages/`](packages/README.md)         | 存放一些 nix 包                                                               |
| 7 | [`parts/`](parts/README.md)               | flake-parts 模块                                                              |
| 8 | [`scripts/`](scripts/README.md)           | 存放专属于本仓库开发用途的脚本文件。                                          |


<!-- END_GEN_README_TREE -->
<!-- dprint-ignore-end -->

## 名称约定

- `funkcia.os.xxx` 存放 NixOS 范围的配置

- `funkcia.hm.xxx` 存放 Home Manager 模块的配置

## Installation Documentations

Here is a [`apply.sh`](./apply.sh) file to build nixos and apply some extra
syncs
