# NixOS Configurations

存放各种 NixOS 系统配置文件的仓库。

[Search Options](https://lhcfl.github.io/nixos-cfg)

## 路径约定

- [`devices/`](devices/) 下的文件存放设备特定的配置
- [`global/`](global/) 下的文件存放对于所有设备都应该默认生效的配置
- [`modules/`](modules/) 下的文件存放默认不生效的模块
- [`home/`](home/README.md) 下的文件存放 Home Manager 配置
- [`utils/`](utils/) 下存放工具函数

## 名称约定

`funkcia.os.xxx` 存放 NixOS 范围的配置
`funkcia.hm.xxx` 存放 Home Manager 模块的配置

## Installation Documentations

Refer to [Documentations](./docs/)

Here is a [`apply.sh`](./apply.sh) file to build nixos and apply some extra syncs