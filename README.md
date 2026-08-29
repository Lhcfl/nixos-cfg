# NixOS Configurations

存放各种 NixOS 系统配置文件的仓库。

[Search Options](https://lhcfl.github.io/nixos-cfg)

## 路径约定

```sh
 .
├──  flake.nix             # flakeroot
├──  AGENTS.md             # markdown for agents
├──  apply.sh              # activator for some non-nix symbollinks
├──  devices/${name}       # device specific settings for ${name}
│   ├──  configuration.nix # configutation for ${name}
│   ├──  services          # device specific services
│   └──  users/${username} # user settings for ${username}
│       ├──  home.nix      # home-manager options
│       └──  os.nix        # nixos options
├── 󱂵 home
│   ├──  home-manager.nix  # global home-manager module
│   ├──  linca
│   │   ├── .... other files            
│   │   └──  home.nix      # home-manager settings for linca
│   ├──  modules           # home-manager modules
│   └── 󰂺 README.md
├──  modules               # NixOS modules
├──  packages              # Nix packages
├──  parts                 # flake parts modules
├── 󰂺 README.md
└──  utils                 # nix utils
    ├──  files.nix
    └──  magic.nix
```

- [`devices/`](devices/) 下的文件存放设备特定的配置
- [`modules/`](modules/) 下的文件存放 NixOS 模块
- [`home`](home/README.md) 下的文件存放 Home Manager 配置
- [`parts`](parts/) 下的文件存放 flake-parts 模块
- [`utils/`](utils/) 下存放工具函数，在 `funkcia-utils` 中可用。
- [`packages/`](packages/) 下存放 Nix packages.

## 名称约定

`funkcia.os.xxx` 存放 NixOS 范围的配置
`funkcia.hm.xxx` 存放 Home Manager 模块的配置

## Installation Documentations

Here is a [`apply.sh`](./apply.sh) file to build nixos and apply some extra syncs