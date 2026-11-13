# NixOS Configurations

存放各种 NixOS 系统配置文件的仓库。

[🔍️ Search Options](https://lhcfl.github.io/nixos-cfg)
[📖️ Options Documentation](docs.md)

## 路径约定

<!-- dprint-ignore-start -->
<!-- BEGIN_GEN_README_TREE -->

[39m|[0m  [1;32m#[0m [39m|[0m                  [1;32mpath[0m                  [39m|[0m                                  [1;32mdescription[0m                                  [39m|[0m
[39m|----|----------------------------------------|-------------------------------------------------------------------------------|[0m
[39m|[0m  [1;32m0[0m [39m|[0m [39m[`devices/`](devices/)[0m                 [39m|[0m [39m存放设备特定的 nix 配置[0m                                                       [39m|[0m
[39m|[0m  [1;32m1[0m [39m|[0m [39m[`fixes/`](fixes/)[0m                     [39m|[0m [39m存放对所有设备、用户生效的“修复”。一般存放上游包有错误的时候，`overrideAttrs`[0m [39m|[0m
[39m|[0m  [1;32m2[0m [39m|[0m [39m[`home/`](home/)[0m                       [39m|[0m [39mHome Manager 用户和模块定义[0m                                                   [39m|[0m
[39m|[0m  [1;32m3[0m [39m|[0m [39m[`home/linca/`](home/linca/)[0m           [39m|[0m [39mLinca 的用户配置[0m                                                              [39m|[0m
[39m|[0m  [1;32m4[0m [39m|[0m [39m[`home/linca/sync/`](home/linca/sync/)[0m [39m|[0m [39m这里的文件直接被软链接到对应文件夹，从而方便无需 switch 随时更改。[0m            [39m|[0m
[39m|[0m  [1;32m5[0m [39m|[0m [39m[`home/modules/`](home/modules/)[0m       [39m|[0m [39m对所有用户生效的 Home Manager 模块[0m                                            [39m|[0m
[39m|[0m  [1;32m6[0m [39m|[0m [39m[`nixos/DE/`](nixos/DE/)[0m               [39m|[0m [39m**D**esktop **E**nvironment Configurations[0m                                    [39m|[0m
[39m|[0m  [1;32m7[0m [39m|[0m [39m[`nixos/`](nixos/)[0m                     [39m|[0m [39m所有设备都可使用的 NixOS module[0m                                               [39m|[0m
[39m|[0m  [1;32m8[0m [39m|[0m [39m[`packages/`](packages/)[0m               [39m|[0m [39m存放一些 nix 包[0m                                                               [39m|[0m
[39m|[0m  [1;32m9[0m [39m|[0m [39m[`parts/`](parts/)[0m                     [39m|[0m [39mflake-parts 模块[0m                                                              [39m|[0m
[39m|[0m [1;32m10[0m [39m|[0m [39m[`scripts/`](scripts/)[0m                 [39m|[0m [39m存放专属于本仓库开发用途的脚本文件。[0m                                          [39m|[0m


<!-- END_GEN_README_TREE -->
<!-- dprint-ignore-end -->

## 名称约定

- `funkcia.os.xxx` 存放 NixOS 范围的配置

- `funkcia.hm.xxx` 存放 Home Manager 模块的配置

## Installation Documentations

Here is a [`apply.sh`](./apply.sh) file to build nixos and apply some extra
syncs
