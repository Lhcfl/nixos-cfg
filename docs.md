| element | content | content_span | attributes |
| --- | --- | --- | --- |
| html | <!-- This documentation is AUTO-GENERATED --> | {start: {line: 1, column: 1}, end: {line: 1, column: 46}} |  |
| html | <!-- by nix build .#funkcia-options-doc-md -o result-doc && install -m0644 result-doc docs.md --> | {start: {line: 2, column: 1}, end: {line: 2, column: 98}} |  |
| html | <!-- NEVER EDIT this documentation --> | {start: {line: 3, column: 1}, end: {line: 3, column: 39}} |  |
| text | Device-specific Home Manager configurations. Each attribute name becomes a
 | {start: {line: 7, column: 1}, end: {line: 8, column: 1}} |  |
| code_inline | homeConfigurations.<name> | {start: {line: 8, column: 1}, end: {line: 8, column: 30}} |  |
| text |  output | {start: {line: 8, column: 30}, end: {line: 8, column: 37}} |  |
| text | Type: | {start: {line: 12, column: 2}, end: {line: 12, column: 7}} |  |
| text | 
raw value | {start: {line: 12, column: 8}, end: {line: 13, column: 10}} |  |
| text | Default: | {start: {line: 17, column: 2}, end: {line: 17, column: 10}} |  |
| text | Example: | {start: {line: 25, column: 2}, end: {line: 25, column: 10}} |  |
| text | Declared by: | {start: {line: 36, column: 2}, end: {line: 36, column: 14}} |  |
| text | system of ‹name› | {start: {line: 45, column: 1}, end: {line: 45, column: 21}} |  |
| text | Type: | {start: {line: 49, column: 2}, end: {line: 49, column: 7}} |  |
| text | 
value “x86_64-linux” (singular enum) | {start: {line: 49, column: 8}, end: {line: 50, column: 41}} |  |
| text | Declared by: | {start: {line: 52, column: 2}, end: {line: 52, column: 14}} |  |
| text | Device-specific NixOS configurations. Each attribute name becomes a
 | {start: {line: 61, column: 1}, end: {line: 62, column: 1}} |  |
| code_inline | nixosConfigurations.<name> | {start: {line: 62, column: 1}, end: {line: 62, column: 31}} |  |
| text |  output, with a corresponding
 | {start: {line: 62, column: 31}, end: {line: 63, column: 1}} |  |
| code_inline | checks.<system>.<name> topLevel | {start: {line: 63, column: 1}, end: {line: 63, column: 36}} |  |
| text |  check. | {start: {line: 63, column: 36}, end: {line: 63, column: 44}} |  |
| text | Type: | {start: {line: 67, column: 2}, end: {line: 67, column: 7}} |  |
| text | 
attribute set of raw value | {start: {line: 67, column: 8}, end: {line: 68, column: 27}} |  |
| text | Default: | {start: {line: 72, column: 2}, end: {line: 72, column: 10}} |  |
| text | Example: | {start: {line: 80, column: 2}, end: {line: 80, column: 10}} |  |
| text | Declared by: | {start: {line: 94, column: 2}, end: {line: 94, column: 14}} |  |
| text | NixOS modules shared across all devices. These are prepended to each
device’s module list before being passed to  | {start: {line: 103, column: 1}, end: {line: 104, column: 47}} |  |
| code_inline | nixosSystem | {start: {line: 104, column: 47}, end: {line: 104, column: 62}} |  |
| text | . | {start: {line: 104, column: 63}, end: {line: 104, column: 64}} |  |
| text | Type: | {start: {line: 108, column: 2}, end: {line: 108, column: 7}} |  |
| text | 
list of raw value | {start: {line: 108, column: 8}, end: {line: 109, column: 18}} |  |
| text | Default: | {start: {line: 113, column: 2}, end: {line: 113, column: 10}} |  |
| text | Example: | {start: {line: 121, column: 2}, end: {line: 121, column: 10}} |  |
| text | Declared by: | {start: {line: 132, column: 2}, end: {line: 132, column: 14}} |  |
| text | 整个配置文件夹被安装在哪里 | {start: {line: 139, column: 1}, end: {line: 139, column: 40}} |  |
| text | Type: | {start: {line: 143, column: 2}, end: {line: 143, column: 7}} |  |
| text | 
string | {start: {line: 143, column: 8}, end: {line: 144, column: 7}} |  |
| text | Default: | {start: {line: 148, column: 2}, end: {line: 148, column: 10}} |  |
| text | Declared by: | {start: {line: 154, column: 2}, end: {line: 154, column: 14}} |  |
| text | Whether to enable Lix, a fork of Nix. | {start: {line: 163, column: 1}, end: {line: 163, column: 39}} |  |
| text | Type: | {start: {line: 167, column: 2}, end: {line: 167, column: 7}} |  |
| text | 
boolean | {start: {line: 167, column: 8}, end: {line: 168, column: 8}} |  |
| text | Default: | {start: {line: 172, column: 2}, end: {line: 172, column: 10}} |  |
| text | Example: | {start: {line: 180, column: 2}, end: {line: 180, column: 10}} |  |
| text | Declared by: | {start: {line: 186, column: 2}, end: {line: 186, column: 14}} |  |
| text | Whether to enable GUI related options. | {start: {line: 195, column: 1}, end: {line: 195, column: 40}} |  |
| text | Type: | {start: {line: 199, column: 2}, end: {line: 199, column: 7}} |  |
| text | 
boolean | {start: {line: 199, column: 8}, end: {line: 200, column: 8}} |  |
| text | Default: | {start: {line: 204, column: 2}, end: {line: 204, column: 10}} |  |
| text | Example: | {start: {line: 212, column: 2}, end: {line: 212, column: 10}} |  |
| text | Declared by: | {start: {line: 218, column: 2}, end: {line: 218, column: 14}} |  |
| text | Whether to enable GNOME components (NixOS Module). | {start: {line: 227, column: 1}, end: {line: 227, column: 52}} |  |
| text | Type: | {start: {line: 231, column: 2}, end: {line: 231, column: 7}} |  |
| text | 
boolean | {start: {line: 231, column: 8}, end: {line: 232, column: 8}} |  |
| text | Default: | {start: {line: 236, column: 2}, end: {line: 236, column: 10}} |  |
| text | Example: | {start: {line: 244, column: 2}, end: {line: 244, column: 10}} |  |
| text | Declared by: | {start: {line: 250, column: 2}, end: {line: 250, column: 14}} |  |
| text | Whether to enable Noctalia Shell
. | {start: {line: 259, column: 1}, end: {line: 260, column: 3}} |  |
| text | Type: | {start: {line: 264, column: 2}, end: {line: 264, column: 7}} |  |
| text | 
boolean | {start: {line: 264, column: 8}, end: {line: 265, column: 8}} |  |
| text | Default: | {start: {line: 269, column: 2}, end: {line: 269, column: 10}} |  |
| text | Example: | {start: {line: 277, column: 2}, end: {line: 277, column: 10}} |  |
| text | Declared by: | {start: {line: 283, column: 2}, end: {line: 283, column: 14}} |  |
| text | Whether to enable Hyprland, A scrollable-tiling Wayland compositor.
. | {start: {line: 292, column: 1}, end: {line: 293, column: 3}} |  |
| text | Type: | {start: {line: 297, column: 2}, end: {line: 297, column: 7}} |  |
| text | 
boolean | {start: {line: 297, column: 8}, end: {line: 298, column: 8}} |  |
| text | Default: | {start: {line: 302, column: 2}, end: {line: 302, column: 10}} |  |
| text | Example: | {start: {line: 310, column: 2}, end: {line: 310, column: 10}} |  |
| text | Declared by: | {start: {line: 316, column: 2}, end: {line: 316, column: 14}} |  |
| text | Whether to enable Niri, A scrollable-tiling Wayland compositor.
. | {start: {line: 325, column: 1}, end: {line: 326, column: 3}} |  |
| text | Type: | {start: {line: 330, column: 2}, end: {line: 330, column: 7}} |  |
| text | 
boolean | {start: {line: 330, column: 8}, end: {line: 331, column: 8}} |  |
| text | Default: | {start: {line: 335, column: 2}, end: {line: 335, column: 10}} |  |
| text | Example: | {start: {line: 343, column: 2}, end: {line: 343, column: 10}} |  |
| text | Declared by: | {start: {line: 349, column: 2}, end: {line: 349, column: 14}} |  |
| text | Whether to enable Umbriel, the compositor by Noctalia team
. | {start: {line: 358, column: 1}, end: {line: 359, column: 3}} |  |
| text | Type: | {start: {line: 363, column: 2}, end: {line: 363, column: 7}} |  |
| text | 
boolean | {start: {line: 363, column: 8}, end: {line: 364, column: 8}} |  |
| text | Default: | {start: {line: 368, column: 2}, end: {line: 368, column: 10}} |  |
| text | Example: | {start: {line: 376, column: 2}, end: {line: 376, column: 10}} |  |
| text | Declared by: | {start: {line: 382, column: 2}, end: {line: 382, column: 14}} |  |
| text | Whether to enable ly module, which is a TUI login manager (or display manager)… | {start: {line: 391, column: 1}, end: {line: 391, column: 82}} |  |
| text | Type: | {start: {line: 395, column: 2}, end: {line: 395, column: 7}} |  |
| text | 
boolean | {start: {line: 395, column: 8}, end: {line: 396, column: 8}} |  |
| text | Default: | {start: {line: 400, column: 2}, end: {line: 400, column: 10}} |  |
| text | Example: | {start: {line: 408, column: 2}, end: {line: 408, column: 10}} |  |
| text | Declared by: | {start: {line: 414, column: 2}, end: {line: 414, column: 14}} |  |
| text | Whether to enable noctalia-greeter module, which is a TUI login manager (or display manager)… | {start: {line: 423, column: 1}, end: {line: 423, column: 96}} |  |
| text | Type: | {start: {line: 427, column: 2}, end: {line: 427, column: 7}} |  |
| text | 
boolean | {start: {line: 427, column: 8}, end: {line: 428, column: 8}} |  |
| text | Default: | {start: {line: 432, column: 2}, end: {line: 432, column: 10}} |  |
| text | Example: | {start: {line: 440, column: 2}, end: {line: 440, column: 10}} |  |
| text | Declared by: | {start: {line: 446, column: 2}, end: {line: 446, column: 14}} |  |
| text | Whether to enable sddm module, which is a GUI login manager (or display manager)… | {start: {line: 455, column: 1}, end: {line: 455, column: 84}} |  |
| text | Type: | {start: {line: 459, column: 2}, end: {line: 459, column: 7}} |  |
| text | 
boolean | {start: {line: 459, column: 8}, end: {line: 460, column: 8}} |  |
| text | Default: | {start: {line: 464, column: 2}, end: {line: 464, column: 10}} |  |
| text | Example: | {start: {line: 472, column: 2}, end: {line: 472, column: 10}} |  |
| text | Declared by: | {start: {line: 478, column: 2}, end: {line: 478, column: 14}} |  |
| text | theme config of the theme. | {start: {line: 487, column: 1}, end: {line: 487, column: 28}} |  |
| text | Type: | {start: {line: 491, column: 2}, end: {line: 491, column: 7}} |  |
| text | 
JSON value | {start: {line: 491, column: 8}, end: {line: 492, column: 11}} |  |
| text | Default: | {start: {line: 496, column: 2}, end: {line: 496, column: 10}} |  |
| text | Example: | {start: {line: 504, column: 2}, end: {line: 504, column: 10}} |  |
| text | Declared by: | {start: {line: 513, column: 2}, end: {line: 513, column: 14}} |  |
| text | theme name of sddm-astronaut-theme. see  | {start: {line: 522, column: 1}, end: {line: 522, column: 42}} |  |
| text | Type: | {start: {line: 526, column: 2}, end: {line: 526, column: 7}} |  |
| text | 
string | {start: {line: 526, column: 8}, end: {line: 527, column: 7}} |  |
| text | Default: | {start: {line: 531, column: 2}, end: {line: 531, column: 10}} |  |
| text | Declared by: | {start: {line: 537, column: 2}, end: {line: 537, column: 14}} |  |
| text | is wayland | {start: {line: 546, column: 1}, end: {line: 546, column: 11}} |  |
| text | Type: | {start: {line: 550, column: 2}, end: {line: 550, column: 7}} |  |
| text | 
boolean | {start: {line: 550, column: 8}, end: {line: 551, column: 8}} |  |
| text | Declared by: | {start: {line: 553, column: 2}, end: {line: 553, column: 14}} |  |
| text | Whether to enable 额外的字体. | {start: {line: 562, column: 1}, end: {line: 562, column: 36}} |  |
| text | Type: | {start: {line: 566, column: 2}, end: {line: 566, column: 7}} |  |
| text | 
boolean | {start: {line: 566, column: 8}, end: {line: 567, column: 8}} |  |
| text | Default: | {start: {line: 571, column: 2}, end: {line: 571, column: 10}} |  |
| text | Example: | {start: {line: 579, column: 2}, end: {line: 579, column: 10}} |  |
| text | Declared by: | {start: {line: 585, column: 2}, end: {line: 585, column: 14}} |  |
| text | Whether to enable Secret Service, an API on D-Bus to allow applications to store secrets securely… | {start: {line: 594, column: 1}, end: {line: 594, column: 101}} |  |
| text | Type: | {start: {line: 598, column: 2}, end: {line: 598, column: 7}} |  |
| text | 
boolean | {start: {line: 598, column: 8}, end: {line: 599, column: 8}} |  |
| text | Default: | {start: {line: 603, column: 2}, end: {line: 603, column: 10}} |  |
| text | Example: | {start: {line: 611, column: 2}, end: {line: 611, column: 10}} |  |
| text | Declared by: | {start: {line: 617, column: 2}, end: {line: 617, column: 14}} |  |
| text | Secret Service 的实现，只能选一个。 | {start: {line: 626, column: 1}, end: {line: 626, column: 46}} |  |
| text | Type: | {start: {line: 630, column: 2}, end: {line: 630, column: 7}} |  |
| text | 
attribute-tagged union with choices: gnome-keyring, oo7 | {start: {line: 630, column: 8}, end: {line: 631, column: 56}} |  |
| text | Default: | {start: {line: 635, column: 2}, end: {line: 635, column: 10}} |  |
| text | Example: | {start: {line: 645, column: 2}, end: {line: 645, column: 10}} |  |
| text | Declared by: | {start: {line: 657, column: 2}, end: {line: 657, column: 14}} |  |
| text | 用 gnome-keyring, GNOME 的 Secret Service 实现。只能靠登录口令解锁 keyring，
指纹登录不行。see  | {start: {line: 666, column: 1}, end: {line: 667, column: 26}} |  |
| text | Type: | {start: {line: 671, column: 2}, end: {line: 671, column: 7}} |  |
| text | 
submodule | {start: {line: 671, column: 8}, end: {line: 672, column: 10}} |  |
| text | Declared by: | {start: {line: 674, column: 2}, end: {line: 674, column: 14}} |  |
| text | 用 oo7, 一个 Rust 编写的 D-Bus Secret Service 提供程序，旨在作为 gnome-keyring
的轻量级跨桌面替代方案。see  | {start: {line: 683, column: 1}, end: {line: 684, column: 41}} |  |
| text | Type: | {start: {line: 688, column: 2}, end: {line: 688, column: 7}} |  |
| text | 
submodule | {start: {line: 688, column: 8}, end: {line: 689, column: 10}} |  |
| text | Declared by: | {start: {line: 691, column: 2}, end: {line: 691, column: 14}} |  |
| text | Whether to enable 用 TPM2 封装的 systemd credential 解锁 keyring（会装一个  | {start: {line: 700, column: 1}, end: {line: 700, column: 87}} |  |
| code_inline | oo7-store-keyring-password | {start: {line: 700, column: 87}, end: {line: 700, column: 117}} |  |
| text | ，跑一次即可）. | {start: {line: 700, column: 117}, end: {line: 700, column: 140}} |  |
| text | Type: | {start: {line: 704, column: 2}, end: {line: 704, column: 7}} |  |
| text | 
boolean | {start: {line: 704, column: 8}, end: {line: 705, column: 8}} |  |
| text | Default: | {start: {line: 709, column: 2}, end: {line: 709, column: 10}} |  |
| text | Example: | {start: {line: 717, column: 2}, end: {line: 717, column: 10}} |  |
| text | Declared by: | {start: {line: 723, column: 2}, end: {line: 723, column: 14}} |  |
| text | Whether to enable btrbk snapshot backup of the home subvolume. | {start: {line: 732, column: 1}, end: {line: 732, column: 64}} |  |
| text | Type: | {start: {line: 736, column: 2}, end: {line: 736, column: 7}} |  |
| text | 
boolean | {start: {line: 736, column: 8}, end: {line: 737, column: 8}} |  |
| text | Default: | {start: {line: 741, column: 2}, end: {line: 741, column: 10}} |  |
| text | Example: | {start: {line: 749, column: 2}, end: {line: 749, column: 10}} |  |
| text | Declared by: | {start: {line: 755, column: 2}, end: {line: 755, column: 14}} |  |
| text | Whether to enable configure ip by sops-nix. | {start: {line: 764, column: 1}, end: {line: 764, column: 45}} |  |
| text | Type: | {start: {line: 768, column: 2}, end: {line: 768, column: 7}} |  |
| text | 
boolean | {start: {line: 768, column: 8}, end: {line: 769, column: 8}} |  |
| text | Default: | {start: {line: 773, column: 2}, end: {line: 773, column: 10}} |  |
| text | Example: | {start: {line: 781, column: 2}, end: {line: 781, column: 10}} |  |
| text | Declared by: | {start: {line: 787, column: 2}, end: {line: 787, column: 14}} |  |
| text | match the device | {start: {line: 796, column: 1}, end: {line: 796, column: 17}} |  |
| text | Type: | {start: {line: 800, column: 2}, end: {line: 800, column: 7}} |  |
| text | 
attribute set of (submodule) | {start: {line: 800, column: 8}, end: {line: 801, column: 29}} |  |
| text | Declared by: | {start: {line: 803, column: 2}, end: {line: 803, column: 14}} |  |
| text | IPv4 地址。例如 123.45.67.89 | {start: {line: 812, column: 1}, end: {line: 812, column: 37}} |  |
| text | 可能为机密的值。设置为下列两种值的一种。 | {start: {line: 814, column: 1}, end: {line: 814, column: 61}} |  |
| text | Type: | {start: {line: 821, column: 2}, end: {line: 821, column: 7}} |  |
| text | 
string | {start: {line: 821, column: 8}, end: {line: 822, column: 7}} |  |
| text | Example: | {start: {line: 826, column: 2}, end: {line: 826, column: 10}} |  |
| text | Declared by: | {start: {line: 832, column: 2}, end: {line: 832, column: 14}} |  |
| text | 网关, 例如 1.2.3.4 | {start: {line: 841, column: 1}, end: {line: 841, column: 26}} |  |
| text | 可能为机密的值。设置为下列两种值的一种。 | {start: {line: 843, column: 1}, end: {line: 843, column: 61}} |  |
| text | Type: | {start: {line: 850, column: 2}, end: {line: 850, column: 7}} |  |
| text | 
string | {start: {line: 850, column: 8}, end: {line: 851, column: 7}} |  |
| text | Example: | {start: {line: 855, column: 2}, end: {line: 855, column: 10}} |  |
| text | Declared by: | {start: {line: 861, column: 2}, end: {line: 861, column: 14}} |  |
| text | 子网掩码。例如 32 | {start: {line: 870, column: 1}, end: {line: 870, column: 25}} |  |
| text | 可能为机密的值。设置为下列两种值的一种。 | {start: {line: 872, column: 1}, end: {line: 872, column: 61}} |  |
| text | Type: | {start: {line: 879, column: 2}, end: {line: 879, column: 7}} |  |
| text | 
string | {start: {line: 879, column: 8}, end: {line: 880, column: 7}} |  |
| text | Example: | {start: {line: 884, column: 2}, end: {line: 884, column: 10}} |  |
| text | Declared by: | {start: {line: 890, column: 2}, end: {line: 890, column: 14}} |  |
| text | 域名后缀 | {start: {line: 899, column: 1}, end: {line: 899, column: 13}} |  |
| text | Type: | {start: {line: 903, column: 2}, end: {line: 903, column: 7}} |  |
| text | 
string | {start: {line: 903, column: 8}, end: {line: 904, column: 7}} |  |
| text | Declared by: | {start: {line: 906, column: 2}, end: {line: 906, column: 14}} |  |
| text | 域名前缀对应的实际域名列表 | {start: {line: 915, column: 1}, end: {line: 915, column: 40}} |  |
| text | Type: | {start: {line: 919, column: 2}, end: {line: 919, column: 7}} |  |
| text | 
attribute set of (submodule) | {start: {line: 919, column: 8}, end: {line: 920, column: 29}} |  |
| text | Declared by: | {start: {line: 922, column: 2}, end: {line: 922, column: 14}} |  |
| text | 实际的域名 | {start: {line: 931, column: 1}, end: {line: 931, column: 16}} |  |
| text | Type: | {start: {line: 935, column: 2}, end: {line: 935, column: 7}} |  |
| text | 
string | {start: {line: 935, column: 8}, end: {line: 936, column: 7}} |  |
| text | Default: | {start: {line: 940, column: 2}, end: {line: 940, column: 10}} |  |
| text | 
 | {start: {line: 940, column: 11}, end: {line: 941, column: 1}} |  |
| code_inline | <name>.<funkcia.os.domain.suffix> | {start: {line: 941, column: 1}, end: {line: 941, column: 38}} |  |
| text | Declared by: | {start: {line: 943, column: 2}, end: {line: 943, column: 14}} |  |
| text | Whether to enable fingerprint module. | {start: {line: 952, column: 1}, end: {line: 952, column: 39}} |  |
| text | Type: | {start: {line: 956, column: 2}, end: {line: 956, column: 7}} |  |
| text | 
boolean | {start: {line: 956, column: 8}, end: {line: 957, column: 8}} |  |
| text | Default: | {start: {line: 961, column: 2}, end: {line: 961, column: 10}} |  |
| text | Example: | {start: {line: 969, column: 2}, end: {line: 969, column: 10}} |  |
| text | Declared by: | {start: {line: 975, column: 2}, end: {line: 975, column: 14}} |  |
| text | If simply enabling fprintd is not enough, try enabling fprintd.tod, and use one of the next four drivers: | {start: {line: 984, column: 1}, end: {line: 984, column: 107}} |  |
| text | see  | {start: {line: 990, column: 1}, end: {line: 990, column: 5}} |  |
| text | Type: | {start: {line: 994, column: 2}, end: {line: 994, column: 7}} |  |
| text | 
null or package | {start: {line: 994, column: 8}, end: {line: 995, column: 16}} |  |
| text | Default: | {start: {line: 999, column: 2}, end: {line: 999, column: 10}} |  |
| text | Declared by: | {start: {line: 1005, column: 2}, end: {line: 1005, column: 14}} |  |
| text | Whether to enable allow cloudflare ips. | {start: {line: 1014, column: 1}, end: {line: 1014, column: 41}} |  |
| text | Type: | {start: {line: 1018, column: 2}, end: {line: 1018, column: 7}} |  |
| text | 
boolean | {start: {line: 1018, column: 8}, end: {line: 1019, column: 8}} |  |
| text | Default: | {start: {line: 1023, column: 2}, end: {line: 1023, column: 10}} |  |
| text | Example: | {start: {line: 1031, column: 2}, end: {line: 1031, column: 10}} |  |
| text | Declared by: | {start: {line: 1037, column: 2}, end: {line: 1037, column: 14}} |  |
| text | allowed TCP ports | {start: {line: 1046, column: 1}, end: {line: 1046, column: 18}} |  |
| text | Type: | {start: {line: 1050, column: 2}, end: {line: 1050, column: 7}} |  |
| text | 
list of signed integer | {start: {line: 1050, column: 8}, end: {line: 1051, column: 23}} |  |
| text | Default: | {start: {line: 1055, column: 2}, end: {line: 1055, column: 10}} |  |
| text | Declared by: | {start: {line: 1064, column: 2}, end: {line: 1064, column: 14}} |  |
| text | Whether to enable flatpak. | {start: {line: 1073, column: 1}, end: {line: 1073, column: 28}} |  |
| text | Type: | {start: {line: 1077, column: 2}, end: {line: 1077, column: 7}} |  |
| text | 
boolean | {start: {line: 1077, column: 8}, end: {line: 1078, column: 8}} |  |
| text | Default: | {start: {line: 1082, column: 2}, end: {line: 1082, column: 10}} |  |
| text | Example: | {start: {line: 1090, column: 2}, end: {line: 1090, column: 10}} |  |
| text | Declared by: | {start: {line: 1096, column: 2}, end: {line: 1096, column: 14}} |  |
| text | Whether to enable incus to manage containers. | {start: {line: 1105, column: 1}, end: {line: 1105, column: 47}} |  |
| text | Type: | {start: {line: 1109, column: 2}, end: {line: 1109, column: 7}} |  |
| text | 
boolean | {start: {line: 1109, column: 8}, end: {line: 1110, column: 8}} |  |
| text | Default: | {start: {line: 1114, column: 2}, end: {line: 1114, column: 10}} |  |
| text | Example: | {start: {line: 1122, column: 2}, end: {line: 1122, column: 10}} |  |
| text | Declared by: | {start: {line: 1128, column: 2}, end: {line: 1128, column: 14}} |  |
| text | Whether to enable mound /nix/store and other nix things into container. | {start: {line: 1137, column: 1}, end: {line: 1137, column: 73}} |  |
| text | Type: | {start: {line: 1141, column: 2}, end: {line: 1141, column: 7}} |  |
| text | 
boolean | {start: {line: 1141, column: 8}, end: {line: 1142, column: 8}} |  |
| text | Default: | {start: {line: 1146, column: 2}, end: {line: 1146, column: 10}} |  |
| text | Example: | {start: {line: 1154, column: 2}, end: {line: 1154, column: 10}} |  |
| text | Declared by: | {start: {line: 1160, column: 2}, end: {line: 1160, column: 14}} |  |
| text | 给 incus 分配的 ipv4 address 范围 | {start: {line: 1169, column: 1}, end: {line: 1169, column: 40}} |  |
| text | Type: | {start: {line: 1173, column: 2}, end: {line: 1173, column: 7}} |  |
| text | 
string | {start: {line: 1173, column: 8}, end: {line: 1174, column: 7}} |  |
| text | Default: | {start: {line: 1178, column: 2}, end: {line: 1178, column: 10}} |  |
| text | Declared by: | {start: {line: 1184, column: 2}, end: {line: 1184, column: 14}} |  |
| text | profiles | {start: {line: 1193, column: 1}, end: {line: 1193, column: 9}} |  |
| text | Type: | {start: {line: 1197, column: 2}, end: {line: 1197, column: 7}} |  |
| text | 
attribute set of (JSON value) | {start: {line: 1197, column: 8}, end: {line: 1198, column: 30}} |  |
| text | Default: | {start: {line: 1202, column: 2}, end: {line: 1202, column: 10}} |  |
| text | Declared by: | {start: {line: 1208, column: 2}, end: {line: 1208, column: 14}} |  |
| text | Whether to enable trust the whole  | {start: {line: 1217, column: 1}, end: {line: 1217, column: 35}} |  |
| code_inline | incusbr0 | {start: {line: 1217, column: 35}, end: {line: 1217, column: 47}} |  |
| text |  interface in firewall. | {start: {line: 1217, column: 47}, end: {line: 1217, column: 71}} |  |
| text | Type: | {start: {line: 1221, column: 2}, end: {line: 1221, column: 7}} |  |
| text | 
boolean | {start: {line: 1221, column: 8}, end: {line: 1222, column: 8}} |  |
| text | Default: | {start: {line: 1226, column: 2}, end: {line: 1226, column: 10}} |  |
| text | Example: | {start: {line: 1234, column: 2}, end: {line: 1234, column: 10}} |  |
| text | Declared by: | {start: {line: 1240, column: 2}, end: {line: 1240, column: 14}} |  |
| text | Whether to enable 自签名. | {start: {line: 1249, column: 1}, end: {line: 1249, column: 30}} |  |
| text | Type: | {start: {line: 1253, column: 2}, end: {line: 1253, column: 7}} |  |
| text | 
boolean | {start: {line: 1253, column: 8}, end: {line: 1254, column: 8}} |  |
| text | Default: | {start: {line: 1258, column: 2}, end: {line: 1258, column: 10}} |  |
| text | Example: | {start: {line: 1266, column: 2}, end: {line: 1266, column: 10}} |  |
| text | Declared by: | {start: {line: 1272, column: 2}, end: {line: 1272, column: 14}} |  |
| text | Whether to enable 现代化的 CLI 工具，包括 fzf, ripgrep 等 | {start: {line: 1281, column: 1}, end: {line: 1281, column: 68}} |  |
| text | 对于所有用户生效
. | {start: {line: 1283, column: 1}, end: {line: 1284, column: 3}} |  |
| text | Type: | {start: {line: 1288, column: 2}, end: {line: 1288, column: 7}} |  |
| text | 
boolean | {start: {line: 1288, column: 8}, end: {line: 1289, column: 8}} |  |
| text | Default: | {start: {line: 1293, column: 2}, end: {line: 1293, column: 10}} |  |
| text | Example: | {start: {line: 1301, column: 2}, end: {line: 1301, column: 10}} |  |
| text | Declared by: | {start: {line: 1307, column: 2}, end: {line: 1307, column: 14}} |  |
| text | Whether to enable networking related settings. | {start: {line: 1316, column: 1}, end: {line: 1316, column: 48}} |  |
| text | Type: | {start: {line: 1320, column: 2}, end: {line: 1320, column: 7}} |  |
| text | 
boolean | {start: {line: 1320, column: 8}, end: {line: 1321, column: 8}} |  |
| text | Default: | {start: {line: 1325, column: 2}, end: {line: 1325, column: 10}} |  |
| text | Example: | {start: {line: 1333, column: 2}, end: {line: 1333, column: 10}} |  |
| text | Declared by: | {start: {line: 1339, column: 2}, end: {line: 1339, column: 14}} |  |
| text | rendered proxy environment attrset | {start: {line: 1348, column: 1}, end: {line: 1348, column: 35}} |  |
| text | Type: | {start: {line: 1352, column: 2}, end: {line: 1352, column: 7}} |  |
| text | 
attribute set of string | {start: {line: 1352, column: 8}, end: {line: 1353, column: 24}} |  |
| text | Default: | {start: {line: 1357, column: 2}, end: {line: 1357, column: 10}} |  |
| text | Declared by: | {start: {line: 1363, column: 2}, end: {line: 1363, column: 14}} |  |
| code_inline | no_proxy | {start: {line: 1372, column: 1}, end: {line: 1372, column: 13}} |  |
| text |  列表：命中的主机不走代理。以  | {start: {line: 1372, column: 13}, end: {line: 1372, column: 57}} |  |
| code_inline | . | {start: {line: 1372, column: 57}, end: {line: 1372, column: 62}} |  |
| text |  开头表示整个域及其子域，
例如  | {start: {line: 1372, column: 62}, end: {line: 1373, column: 8}} |  |
| code_inline | .local | {start: {line: 1373, column: 8}, end: {line: 1373, column: 18}} |  |
| text |  覆盖所有 mDNS 名字。 | {start: {line: 1373, column: 18}, end: {line: 1373, column: 46}} |  |
| text | Type: | {start: {line: 1377, column: 2}, end: {line: 1377, column: 7}} |  |
| text | 
list of string | {start: {line: 1377, column: 8}, end: {line: 1378, column: 15}} |  |
| text | Default: | {start: {line: 1382, column: 2}, end: {line: 1382, column: 10}} |  |
| text | Example: | {start: {line: 1396, column: 2}, end: {line: 1396, column: 10}} |  |
| text | Declared by: | {start: {line: 1405, column: 2}, end: {line: 1405, column: 14}} |  |
| text | This option specifies the default value for httpProxy, httpsProxy, ftpProxy and rsyncProxy. | {start: {line: 1414, column: 1}, end: {line: 1414, column: 93}} |  |
| text | Type: | {start: {line: 1418, column: 2}, end: {line: 1418, column: 7}} |  |
| text | 
null or string | {start: {line: 1418, column: 8}, end: {line: 1419, column: 15}} |  |
| text | Default: | {start: {line: 1423, column: 2}, end: {line: 1423, column: 10}} |  |
| text | Example: | {start: {line: 1431, column: 2}, end: {line: 1431, column: 10}} |  |
| text | Declared by: | {start: {line: 1437, column: 2}, end: {line: 1437, column: 14}} |  |
| text | Whether to enable NSN,  | {start: {line: 1446, column: 1}, end: {line: 1446, column: 24}} |  |
| text | NixOS Subsystem of NixOS | {start: {line: 1446, column: 26}, end: {line: 1446, column: 50}} |  |
| text | 
. | {start: {line: 1446, column: 52}, end: {line: 1447, column: 3}} |  |
| text | Type: | {start: {line: 1451, column: 2}, end: {line: 1451, column: 7}} |  |
| text | 
boolean | {start: {line: 1451, column: 8}, end: {line: 1452, column: 8}} |  |
| text | Default: | {start: {line: 1456, column: 2}, end: {line: 1456, column: 10}} |  |
| text | Example: | {start: {line: 1464, column: 2}, end: {line: 1464, column: 10}} |  |
| text | Declared by: | {start: {line: 1470, column: 2}, end: {line: 1470, column: 14}} |  |
| text | 该选项只是为 NixOS 的  | {start: {line: 1479, column: 1}, end: {line: 1479, column: 30}} |  |
| code_inline | config.containers | {start: {line: 1479, column: 30}, end: {line: 1479, column: 51}} |  |
| text |  添加了一些默认值。
会整体合并到  | {start: {line: 1479, column: 51}, end: {line: 1480, column: 20}} |  |
| code_inline | config.containers | {start: {line: 1480, column: 20}, end: {line: 1480, column: 41}} |  |
| text | 具体参见 NixOS Module 的  | {start: {line: 1482, column: 1}, end: {line: 1482, column: 31}} |  |
| text | Type: | {start: {line: 1486, column: 2}, end: {line: 1486, column: 7}} |  |
| text | 
attribute set of raw value | {start: {line: 1486, column: 8}, end: {line: 1487, column: 27}} |  |
| text | Default: | {start: {line: 1491, column: 2}, end: {line: 1491, column: 10}} |  |
| text | Declared by: | {start: {line: 1497, column: 2}, end: {line: 1497, column: 14}} |  |
| text | NAT 对外的 interface | {start: {line: 1506, column: 1}, end: {line: 1506, column: 24}} |  |
| text | Type: | {start: {line: 1510, column: 2}, end: {line: 1510, column: 7}} |  |
| text | 
string | {start: {line: 1510, column: 8}, end: {line: 1511, column: 7}} |  |
| text | Declared by: | {start: {line: 1513, column: 2}, end: {line: 1513, column: 14}} |  |
| text | Whether to enable 这台机器是 CN 机器. | {start: {line: 1522, column: 1}, end: {line: 1522, column: 46}} |  |
| text | Type: | {start: {line: 1526, column: 2}, end: {line: 1526, column: 7}} |  |
| text | 
boolean | {start: {line: 1526, column: 8}, end: {line: 1527, column: 8}} |  |
| text | Default: | {start: {line: 1531, column: 2}, end: {line: 1531, column: 10}} |  |
| text | Example: | {start: {line: 1539, column: 2}, end: {line: 1539, column: 10}} |  |
| text | Declared by: | {start: {line: 1545, column: 2}, end: {line: 1545, column: 14}} |  |
| text | Whether to enable 该系统是一个容器. | {start: {line: 1554, column: 1}, end: {line: 1554, column: 45}} |  |
| text | Type: | {start: {line: 1558, column: 2}, end: {line: 1558, column: 7}} |  |
| text | 
boolean | {start: {line: 1558, column: 8}, end: {line: 1559, column: 8}} |  |
| text | Default: | {start: {line: 1563, column: 2}, end: {line: 1563, column: 10}} |  |
| text | Example: | {start: {line: 1571, column: 2}, end: {line: 1571, column: 10}} |  |
| text | Declared by: | {start: {line: 1577, column: 2}, end: {line: 1577, column: 14}} |  |
| text | Whether to enable 全局默认值. | {start: {line: 1586, column: 1}, end: {line: 1586, column: 36}} |  |
| text | Type: | {start: {line: 1590, column: 2}, end: {line: 1590, column: 7}} |  |
| text | 
boolean | {start: {line: 1590, column: 8}, end: {line: 1591, column: 8}} |  |
| text | Default: | {start: {line: 1595, column: 2}, end: {line: 1595, column: 10}} |  |
| text | Example: | {start: {line: 1603, column: 2}, end: {line: 1603, column: 10}} |  |
| text | Declared by: | {start: {line: 1609, column: 2}, end: {line: 1609, column: 14}} |  |
| text | Whether to enable locale and input settings. | {start: {line: 1618, column: 1}, end: {line: 1618, column: 46}} |  |
| text | Type: | {start: {line: 1622, column: 2}, end: {line: 1622, column: 7}} |  |
| text | 
boolean | {start: {line: 1622, column: 8}, end: {line: 1623, column: 8}} |  |
| text | Default: | {start: {line: 1627, column: 2}, end: {line: 1627, column: 10}} |  |
| text | Example: | {start: {line: 1635, column: 2}, end: {line: 1635, column: 10}} |  |
| text | Declared by: | {start: {line: 1641, column: 2}, end: {line: 1641, column: 14}} |  |
| text | Whether to enable 全局安全相关设置. | {start: {line: 1650, column: 1}, end: {line: 1650, column: 45}} |  |
| text | Type: | {start: {line: 1654, column: 2}, end: {line: 1654, column: 7}} |  |
| text | 
boolean | {start: {line: 1654, column: 8}, end: {line: 1655, column: 8}} |  |
| text | Default: | {start: {line: 1659, column: 2}, end: {line: 1659, column: 10}} |  |
| text | Example: | {start: {line: 1667, column: 2}, end: {line: 1667, column: 10}} |  |
| text | Declared by: | {start: {line: 1673, column: 2}, end: {line: 1673, column: 14}} |  |
| text | Whether to enable replace pkexec with run0-pkexec-wrapper. | {start: {line: 1682, column: 1}, end: {line: 1682, column: 60}} |  |
| text | Type: | {start: {line: 1686, column: 2}, end: {line: 1686, column: 7}} |  |
| text | 
boolean | {start: {line: 1686, column: 8}, end: {line: 1687, column: 8}} |  |
| text | Default: | {start: {line: 1691, column: 2}, end: {line: 1691, column: 10}} |  |
| text | Example: | {start: {line: 1699, column: 2}, end: {line: 1699, column: 10}} |  |
| text | Declared by: | {start: {line: 1705, column: 2}, end: {line: 1705, column: 14}} |  |
| text | Whether to enable automatelly add necessary terminfos. | {start: {line: 1714, column: 1}, end: {line: 1714, column: 56}} |  |
| text | 从 kitty/foot/ghostty 等终端 SSH 登录时，远端需要对应的 terminfo 条目，
否则许多程序会警告终端功能不全
. | {start: {line: 1716, column: 1}, end: {line: 1718, column: 3}} |  |
| text | Type: | {start: {line: 1722, column: 2}, end: {line: 1722, column: 7}} |  |
| text | 
boolean | {start: {line: 1722, column: 8}, end: {line: 1723, column: 8}} |  |
| text | Default: | {start: {line: 1727, column: 2}, end: {line: 1727, column: 10}} |  |
| text | Example: | {start: {line: 1735, column: 2}, end: {line: 1735, column: 10}} |  |
| text | Declared by: | {start: {line: 1741, column: 2}, end: {line: 1741, column: 14}} |  |
| text | Whether to enable ALL terminfo. | {start: {line: 1750, column: 1}, end: {line: 1750, column: 33}} |  |
| text | Type: | {start: {line: 1754, column: 2}, end: {line: 1754, column: 7}} |  |
| text | 
boolean | {start: {line: 1754, column: 8}, end: {line: 1755, column: 8}} |  |
| text | Default: | {start: {line: 1759, column: 2}, end: {line: 1759, column: 10}} |  |
| text | Example: | {start: {line: 1767, column: 2}, end: {line: 1767, column: 10}} |  |
| text | Declared by: | {start: {line: 1773, column: 2}, end: {line: 1773, column: 14}} |  |
| text | Whether to enable 该系统是一台主机. | {start: {line: 1782, column: 1}, end: {line: 1782, column: 45}} |  |
| text | Type: | {start: {line: 1786, column: 2}, end: {line: 1786, column: 7}} |  |
| text | 
boolean | {start: {line: 1786, column: 8}, end: {line: 1787, column: 8}} |  |
| text | Default: | {start: {line: 1791, column: 2}, end: {line: 1791, column: 10}} |  |
| text | Example: | {start: {line: 1799, column: 2}, end: {line: 1799, column: 10}} |  |
| text | Declared by: | {start: {line: 1805, column: 2}, end: {line: 1805, column: 14}} |  |
| text | Whether to enable btrfs tools. | {start: {line: 1814, column: 1}, end: {line: 1814, column: 32}} |  |
| text | Type: | {start: {line: 1818, column: 2}, end: {line: 1818, column: 7}} |  |
| text | 
boolean | {start: {line: 1818, column: 8}, end: {line: 1819, column: 8}} |  |
| text | Default: | {start: {line: 1823, column: 2}, end: {line: 1823, column: 10}} |  |
| text | Example: | {start: {line: 1831, column: 2}, end: {line: 1831, column: 10}} |  |
| text | Declared by: | {start: {line: 1837, column: 2}, end: {line: 1837, column: 14}} |  |
| text | Whether to enable collect user services. | {start: {line: 1846, column: 1}, end: {line: 1846, column: 42}} |  |
| text | Type: | {start: {line: 1850, column: 2}, end: {line: 1850, column: 7}} |  |
| text | 
boolean | {start: {line: 1850, column: 8}, end: {line: 1851, column: 8}} |  |
| text | Default: | {start: {line: 1855, column: 2}, end: {line: 1855, column: 10}} |  |
| text | Example: | {start: {line: 1863, column: 2}, end: {line: 1863, column: 10}} |  |
| text | Declared by: | {start: {line: 1869, column: 2}, end: {line: 1869, column: 14}} |  |
| text | Whether to enable 常用程序与开发工具. | {start: {line: 1878, column: 1}, end: {line: 1878, column: 48}} |  |
| text | Type: | {start: {line: 1882, column: 2}, end: {line: 1882, column: 7}} |  |
| text | 
boolean | {start: {line: 1882, column: 8}, end: {line: 1883, column: 8}} |  |
| text | Default: | {start: {line: 1887, column: 2}, end: {line: 1887, column: 10}} |  |
| text | Example: | {start: {line: 1895, column: 2}, end: {line: 1895, column: 10}} |  |
| text | Declared by: | {start: {line: 1901, column: 2}, end: {line: 1901, column: 14}} |  |
| text | Whether to enable root 用户相关设置. | {start: {line: 1910, column: 1}, end: {line: 1910, column: 44}} |  |
| text | Type: | {start: {line: 1914, column: 2}, end: {line: 1914, column: 7}} |  |
| text | 
boolean | {start: {line: 1914, column: 8}, end: {line: 1915, column: 8}} |  |
| text | Default: | {start: {line: 1919, column: 2}, end: {line: 1919, column: 10}} |  |
| text | Example: | {start: {line: 1927, column: 2}, end: {line: 1927, column: 10}} |  |
| text | Declared by: | {start: {line: 1933, column: 2}, end: {line: 1933, column: 14}} |  |
| text | Whether to enable 基础系统服务. | {start: {line: 1942, column: 1}, end: {line: 1942, column: 39}} |  |
| text | Type: | {start: {line: 1946, column: 2}, end: {line: 1946, column: 7}} |  |
| text | 
boolean | {start: {line: 1946, column: 8}, end: {line: 1947, column: 8}} |  |
| text | Default: | {start: {line: 1951, column: 2}, end: {line: 1951, column: 10}} |  |
| text | Example: | {start: {line: 1959, column: 2}, end: {line: 1959, column: 10}} |  |
| text | Declared by: | {start: {line: 1965, column: 2}, end: {line: 1965, column: 14}} |  |
| text | Whether to enable shell 相关设置. | {start: {line: 1974, column: 1}, end: {line: 1974, column: 39}} |  |
| text | Type: | {start: {line: 1978, column: 2}, end: {line: 1978, column: 7}} |  |
| text | 
boolean | {start: {line: 1978, column: 8}, end: {line: 1979, column: 8}} |  |
| text | Default: | {start: {line: 1983, column: 2}, end: {line: 1983, column: 10}} |  |
| text | Example: | {start: {line: 1991, column: 2}, end: {line: 1991, column: 10}} |  |
| text | Declared by: | {start: {line: 1997, column: 2}, end: {line: 1997, column: 14}} |  |
| text | Whether to enable 这台机器为笔记本电脑. | {start: {line: 2006, column: 1}, end: {line: 2006, column: 51}} |  |
| text | Type: | {start: {line: 2010, column: 2}, end: {line: 2010, column: 7}} |  |
| text | 
boolean | {start: {line: 2010, column: 8}, end: {line: 2011, column: 8}} |  |
| text | Default: | {start: {line: 2015, column: 2}, end: {line: 2015, column: 10}} |  |
| text | Example: | {start: {line: 2023, column: 2}, end: {line: 2023, column: 10}} |  |
| text | Declared by: | {start: {line: 2029, column: 2}, end: {line: 2029, column: 14}} |  |
| text | funkcia: Power management tool to use on laptops. | {start: {line: 2038, column: 1}, end: {line: 2038, column: 51}} |  |
| text | Type: | {start: {line: 2042, column: 2}, end: {line: 2042, column: 7}} |  |
| text | 
one of “power-profiles-daemon”, “tlp” | {start: {line: 2042, column: 8}, end: {line: 2043, column: 46}} |  |
| text | Default: | {start: {line: 2047, column: 2}, end: {line: 2047, column: 10}} |  |
| text | Declared by: | {start: {line: 2053, column: 2}, end: {line: 2053, column: 14}} |  |
| text | Whether to enable 这台机器是日用机器. | {start: {line: 2062, column: 1}, end: {line: 2062, column: 48}} |  |
| text | Type: | {start: {line: 2066, column: 2}, end: {line: 2066, column: 7}} |  |
| text | 
boolean | {start: {line: 2066, column: 8}, end: {line: 2067, column: 8}} |  |
| text | Default: | {start: {line: 2071, column: 2}, end: {line: 2071, column: 10}} |  |
| text | Example: | {start: {line: 2079, column: 2}, end: {line: 2079, column: 10}} |  |
| text | Declared by: | {start: {line: 2085, column: 2}, end: {line: 2085, column: 14}} |  |
| text | Whether to enable 这台机器是服务器机器. | {start: {line: 2094, column: 1}, end: {line: 2094, column: 51}} |  |
| text | Type: | {start: {line: 2098, column: 2}, end: {line: 2098, column: 7}} |  |
| text | 
boolean | {start: {line: 2098, column: 8}, end: {line: 2099, column: 8}} |  |
| text | Default: | {start: {line: 2103, column: 2}, end: {line: 2103, column: 10}} |  |
| text | Example: | {start: {line: 2111, column: 2}, end: {line: 2111, column: 10}} |  |
| text | Declared by: | {start: {line: 2117, column: 2}, end: {line: 2117, column: 14}} |  |
| text | Whether to enable Secure Boot on your NixOS system using  | {start: {line: 2126, column: 1}, end: {line: 2126, column: 58}} |  |
| code_inline | lanzaboote | {start: {line: 2126, column: 58}, end: {line: 2126, column: 72}} |  |
| text |  and  | {start: {line: 2126, column: 72}, end: {line: 2126, column: 77}} |  |
| code_inline | sbctl | {start: {line: 2126, column: 77}, end: {line: 2126, column: 86}} |  |
| text | . | {start: {line: 2126, column: 87}, end: {line: 2126, column: 88}} |  |
| text | Please refer to  | {start: {line: 2128, column: 1}, end: {line: 2128, column: 17}} |  |
| text | The module has been configured to automatically generate and enroll keys. However,
i don’t know, but if it didn’t works, you may need to prepare your system and
create the necessary keys manually if you prefer. | {start: {line: 2130, column: 1}, end: {line: 2132, column: 51}} |  |
| text | PREPARE YOUR SYSTEM | {start: {line: 2134, column: 3}, end: {line: 2134, column: 22}} |  |
| text | Exit “User Mode” in your firmware settings, and enable “Setup Mode”. | {start: {line: 2136, column: 1}, end: {line: 2136, column: 78}} |  |
| code | sudo sbctl create-keys

# Expected output:
# [sudo] password for linca:
# Created Owner UUID 8ec4b2c3-dc7f-4362-b9a3-0cc17e5a34cd
# Creating secure boot keys...✓
# Secure boot keys created! | {start: {line: 2138, column: 1}, end: {line: 2146, column: 4}} |  |
| code | sudo sbctl enroll-keys

# enroll the keys into your firmware. | {start: {line: 2148, column: 1}, end: {line: 2152, column: 4}} |  |
| code | sudo sbctl verify

# Verify that your system is ready for Secure Boot.
# Expected output:
# ✓ /boot/EFI/Boot/bootx64.efi is signed
# ✓ /boot/EFI/Linux/nixos-generation-66-pexlogtmhjjwua4micjecfr6p6chnd64d4uauxfkishwlcgyauza.efi is signed
# ✗ /boot/EFI/Microsoft/Boot/zh-TW/memtest.efi.mui is not signed
# ✗ /boot/EFI/nixos/kernel-6.18.2-otn6nn3tkudhh5xpj5736u2q3h4kjzojd6fkg4rqzdf5l5c7gxuq.efi is not signed
# ✓ /boot/EFI/systemd/systemd-bootx64.efi is signed
# It is expected that kernel-xxx and Microsoft files are not signed. | {start: {line: 2154, column: 1}, end: {line: 2165, column: 4}} |  |
| text | . | {start: {line: 2167, column: 2}, end: {line: 2167, column: 3}} |  |
| text | Type: | {start: {line: 2171, column: 2}, end: {line: 2171, column: 7}} |  |
| text | 
boolean | {start: {line: 2171, column: 8}, end: {line: 2172, column: 8}} |  |
| text | Default: | {start: {line: 2176, column: 2}, end: {line: 2176, column: 10}} |  |
| text | Example: | {start: {line: 2184, column: 2}, end: {line: 2184, column: 10}} |  |
| text | Declared by: | {start: {line: 2190, column: 2}, end: {line: 2190, column: 14}} |  |
| text | Whether to enable sops support. disabling it will disable all sops encryptions. | {start: {line: 2199, column: 1}, end: {line: 2199, column: 82}} |  |
| text | Type: | {start: {line: 2203, column: 2}, end: {line: 2203, column: 7}} |  |
| text | 
boolean | {start: {line: 2203, column: 8}, end: {line: 2204, column: 8}} |  |
| text | Default: | {start: {line: 2208, column: 2}, end: {line: 2208, column: 10}} |  |
| text | Example: | {start: {line: 2216, column: 2}, end: {line: 2216, column: 10}} |  |
| text | Declared by: | {start: {line: 2222, column: 2}, end: {line: 2222, column: 14}} |  |
| text | Whether to enable 系统推荐设置. | {start: {line: 2231, column: 1}, end: {line: 2231, column: 39}} |  |
| text | Type: | {start: {line: 2235, column: 2}, end: {line: 2235, column: 7}} |  |
| text | 
boolean | {start: {line: 2235, column: 8}, end: {line: 2236, column: 8}} |  |
| text | Default: | {start: {line: 2240, column: 2}, end: {line: 2240, column: 10}} |  |
| text | Example: | {start: {line: 2248, column: 2}, end: {line: 2248, column: 10}} |  |
| text | Declared by: | {start: {line: 2254, column: 2}, end: {line: 2254, column: 14}} |  |
| text | Whether to enable replace CUBIC with BBR.
用 Google BBR 替代默认 CUBIC, 高延迟/丢包网络下吞吐更高、延迟更低，国内网络改善明显。
. | {start: {line: 2263, column: 1}, end: {line: 2265, column: 3}} |  |
| text | Type: | {start: {line: 2269, column: 2}, end: {line: 2269, column: 7}} |  |
| text | 
boolean | {start: {line: 2269, column: 8}, end: {line: 2270, column: 8}} |  |
| text | Default: | {start: {line: 2274, column: 2}, end: {line: 2274, column: 10}} |  |
| text | Example: | {start: {line: 2282, column: 2}, end: {line: 2282, column: 10}} |  |
| text | Declared by: | {start: {line: 2288, column: 2}, end: {line: 2288, column: 14}} |  |
| text | Whether to enable TPM 模块。
see  | {start: {line: 2297, column: 1}, end: {line: 2298, column: 5}} |  |
| text | 
. | {start: {line: 2298, column: 33}, end: {line: 2299, column: 3}} |  |
| text | Type: | {start: {line: 2303, column: 2}, end: {line: 2303, column: 7}} |  |
| text | 
boolean | {start: {line: 2303, column: 8}, end: {line: 2304, column: 8}} |  |
| text | Default: | {start: {line: 2308, column: 2}, end: {line: 2308, column: 10}} |  |
| text | Example: | {start: {line: 2316, column: 2}, end: {line: 2316, column: 10}} |  |
| text | Declared by: | {start: {line: 2322, column: 2}, end: {line: 2322, column: 14}} |  |
| text | Whether to enable tpm-fido. | {start: {line: 2331, column: 1}, end: {line: 2331, column: 29}} |  |
| text | Type: | {start: {line: 2335, column: 2}, end: {line: 2335, column: 7}} |  |
| text | 
boolean | {start: {line: 2335, column: 8}, end: {line: 2336, column: 8}} |  |
| text | Default: | {start: {line: 2340, column: 2}, end: {line: 2340, column: 10}} |  |
| text | Example: | {start: {line: 2348, column: 2}, end: {line: 2348, column: 10}} |  |
| text | Declared by: | {start: {line: 2354, column: 2}, end: {line: 2354, column: 14}} |  |
| text | 包了一层用户 | {start: {line: 2363, column: 1}, end: {line: 2363, column: 19}} |  |
| text | Type: | {start: {line: 2367, column: 2}, end: {line: 2367, column: 7}} |  |
| text | 
attribute set of (submodule) | {start: {line: 2367, column: 8}, end: {line: 2368, column: 29}} |  |
| text | Declared by: | {start: {line: 2370, column: 2}, end: {line: 2370, column: 14}} |  |
| text | Whether to enable admin priviledge. | {start: {line: 2379, column: 1}, end: {line: 2379, column: 37}} |  |
| text | Type: | {start: {line: 2383, column: 2}, end: {line: 2383, column: 7}} |  |
| text | 
boolean | {start: {line: 2383, column: 8}, end: {line: 2384, column: 8}} |  |
| text | Default: | {start: {line: 2388, column: 2}, end: {line: 2388, column: 10}} |  |
| text | Example: | {start: {line: 2396, column: 2}, end: {line: 2396, column: 10}} |  |
| text | Declared by: | {start: {line: 2402, column: 2}, end: {line: 2402, column: 14}} |  |
| text | Whether to enable SSH login. | {start: {line: 2411, column: 1}, end: {line: 2411, column: 30}} |  |
| text | Type: | {start: {line: 2415, column: 2}, end: {line: 2415, column: 7}} |  |
| text | 
boolean | {start: {line: 2415, column: 8}, end: {line: 2416, column: 8}} |  |
| text | Default: | {start: {line: 2420, column: 2}, end: {line: 2420, column: 10}} |  |
| text | Example: | {start: {line: 2428, column: 2}, end: {line: 2428, column: 10}} |  |
| text | Declared by: | {start: {line: 2434, column: 2}, end: {line: 2434, column: 14}} |  |
| text | Whether to enable connection to winslow’s cloud. | {start: {line: 2443, column: 1}, end: {line: 2443, column: 52}} |  |
| text | Type: | {start: {line: 2447, column: 2}, end: {line: 2447, column: 7}} |  |
| text | 
boolean | {start: {line: 2447, column: 8}, end: {line: 2448, column: 8}} |  |
| text | Default: | {start: {line: 2452, column: 2}, end: {line: 2452, column: 10}} |  |
| text | Example: | {start: {line: 2460, column: 2}, end: {line: 2460, column: 10}} |  |
| text | Declared by: | {start: {line: 2466, column: 2}, end: {line: 2466, column: 14}} |  |
| text | Whether to enable kerberos client for winslow’s cloud. | {start: {line: 2475, column: 1}, end: {line: 2475, column: 58}} |  |
| text | Type: | {start: {line: 2479, column: 2}, end: {line: 2479, column: 7}} |  |
| text | 
boolean | {start: {line: 2479, column: 8}, end: {line: 2480, column: 8}} |  |
| text | Default: | {start: {line: 2484, column: 2}, end: {line: 2484, column: 10}} |  |
| text | Example: | {start: {line: 2492, column: 2}, end: {line: 2492, column: 10}} |  |
| text | Declared by: | {start: {line: 2498, column: 2}, end: {line: 2498, column: 14}} |  |
| code_inline | default_ccache_name | {start: {line: 2507, column: 1}, end: {line: 2507, column: 24}} |  |
| text |  for krb5.conf. | {start: {line: 2507, column: 24}, end: {line: 2507, column: 41}} |  |
| text | The default keeps tickets in the per-user tmpfs runtime directory:
it is 0700, cleared on reboot, and does not leave stale files behind
in /tmp. Use  | {start: {line: 2509, column: 1}, end: {line: 2511, column: 15}} |  |
| code_inline | KEYRING:persistent:%{uid} | {start: {line: 2511, column: 15}, end: {line: 2511, column: 44}} |  |
| text |  for kernel-keyring backed
ccache (what ipa-client-install picks), or  | {start: {line: 2511, column: 44}, end: {line: 2512, column: 44}} |  |
| code_inline | KCM:%{uid} | {start: {line: 2512, column: 44}, end: {line: 2512, column: 58}} |  |
| text |  when a kcm
daemon is running. | {start: {line: 2512, column: 58}, end: {line: 2513, column: 20}} |  |
| text | Type: | {start: {line: 2517, column: 2}, end: {line: 2517, column: 7}} |  |
| text | 
string | {start: {line: 2517, column: 8}, end: {line: 2518, column: 7}} |  |
| text | Default: | {start: {line: 2522, column: 2}, end: {line: 2522, column: 10}} |  |
| text | Declared by: | {start: {line: 2528, column: 2}, end: {line: 2528, column: 14}} |  |
| text | Whether to enable global agents management. | {start: {line: 2535, column: 1}, end: {line: 2535, column: 45}} |  |
| text | Type: | {start: {line: 2539, column: 2}, end: {line: 2539, column: 7}} |  |
| text | 
boolean | {start: {line: 2539, column: 8}, end: {line: 2540, column: 8}} |  |
| text | Default: | {start: {line: 2544, column: 2}, end: {line: 2544, column: 10}} |  |
| text | Example: | {start: {line: 2552, column: 2}, end: {line: 2552, column: 10}} |  |
| text | Declared by: | {start: {line: 2558, column: 2}, end: {line: 2558, column: 14}} |  |
| text | where to put global AGENTS.md, relative to home | {start: {line: 2567, column: 1}, end: {line: 2567, column: 49}} |  |
| text | Type: | {start: {line: 2571, column: 2}, end: {line: 2571, column: 7}} |  |
| text | 
list of string | {start: {line: 2571, column: 8}, end: {line: 2572, column: 15}} |  |
| text | Default: | {start: {line: 2576, column: 2}, end: {line: 2576, column: 10}} |  |
| text | Declared by: | {start: {line: 2582, column: 2}, end: {line: 2582, column: 14}} |  |
| text | global AGENTS.md, per section | {start: {line: 2591, column: 1}, end: {line: 2591, column: 31}} |  |
| text | Type: | {start: {line: 2595, column: 2}, end: {line: 2595, column: 7}} |  |
| text | 
strings concatenated with “\\n” | {start: {line: 2595, column: 8}, end: {line: 2596, column: 36}} |  |
| text | Default: | {start: {line: 2600, column: 2}, end: {line: 2600, column: 10}} |  |
| text | Declared by: | {start: {line: 2606, column: 2}, end: {line: 2606, column: 14}} |  |
| text | path of your avatar | {start: {line: 2615, column: 1}, end: {line: 2615, column: 20}} |  |
| text | Type: | {start: {line: 2619, column: 2}, end: {line: 2619, column: 7}} |  |
| text | 
null or absolute path | {start: {line: 2619, column: 8}, end: {line: 2620, column: 22}} |  |
| text | Default: | {start: {line: 2624, column: 2}, end: {line: 2624, column: 10}} |  |
| text | Declared by: | {start: {line: 2630, column: 2}, end: {line: 2630, column: 14}} |  |
| text | Whether to enable manage the user-level Flatpak overrides under  | {start: {line: 2639, column: 1}, end: {line: 2639, column: 65}} |  |
| code_inline | ~/.local/share/flatpak/overrides | {start: {line: 2639, column: 65}, end: {line: 2639, column: 101}} |  |
| text |  declaratively.
. | {start: {line: 2639, column: 101}, end: {line: 2640, column: 3}} |  |
| text | Type: | {start: {line: 2644, column: 2}, end: {line: 2644, column: 7}} |  |
| text | 
boolean | {start: {line: 2644, column: 8}, end: {line: 2645, column: 8}} |  |
| text | Default: | {start: {line: 2649, column: 2}, end: {line: 2649, column: 10}} |  |
| text | Example: | {start: {line: 2657, column: 2}, end: {line: 2657, column: 10}} |  |
| text | Declared by: | {start: {line: 2663, column: 2}, end: {line: 2663, column: 14}} |  |
| text | Whether to enable make the host’s  | {start: {line: 2672, column: 1}, end: {line: 2672, column: 37}} |  |
| code_inline | fonts.fontconfig.defaultFonts | {start: {line: 2672, column: 37}, end: {line: 2672, column: 70}} |  |
| text |  preferences
visible to every Flatpak sandbox through a global override.
. | {start: {line: 2672, column: 70}, end: {line: 2674, column: 3}} |  |
| text | Type: | {start: {line: 2678, column: 2}, end: {line: 2678, column: 7}} |  |
| text | 
boolean | {start: {line: 2678, column: 8}, end: {line: 2679, column: 8}} |  |
| text | Default: | {start: {line: 2683, column: 2}, end: {line: 2683, column: 10}} |  |
| text | Example: | {start: {line: 2691, column: 2}, end: {line: 2691, column: 10}} |  |
| text | Declared by: | {start: {line: 2697, column: 2}, end: {line: 2697, column: 14}} |  |
| text | Whether to enable expose the host  | {start: {line: 2706, column: 1}, end: {line: 2706, column: 35}} |  |
| code_inline | /nix/store | {start: {line: 2706, column: 35}, end: {line: 2706, column: 49}} |  |
| text |  read-only inside every Flatpak
sandbox through a global override. | {start: {line: 2706, column: 49}, end: {line: 2707, column: 36}} |  |
| text | NixOS keeps themes, cursors and other resources under  | {start: {line: 2709, column: 1}, end: {line: 2709, column: 55}} |  |
| code_inline | /nix/store | {start: {line: 2709, column: 55}, end: {line: 2709, column: 69}} |  |
| text | , which
is invisible to Flatpak sandboxes by default. Mounting it fixes issues
such as missing X11 cursor themes; the trade-off is that every sandboxed
application gains read access to the whole store.
. | {start: {line: 2709, column: 69}, end: {line: 2713, column: 3}} |  |
| text | Type: | {start: {line: 2717, column: 2}, end: {line: 2717, column: 7}} |  |
| text | 
boolean | {start: {line: 2717, column: 8}, end: {line: 2718, column: 8}} |  |
| text | Default: | {start: {line: 2722, column: 2}, end: {line: 2722, column: 10}} |  |
| text | Example: | {start: {line: 2730, column: 2}, end: {line: 2730, column: 10}} |  |
| text | Declared by: | {start: {line: 2736, column: 2}, end: {line: 2736, column: 14}} |  |
| text | Flatpak overrides keyed by application ID, or  | {start: {line: 2745, column: 1}, end: {line: 2745, column: 47}} |  |
| code_inline | global | {start: {line: 2745, column: 47}, end: {line: 2745, column: 57}} |  |
| text |  to apply to every
application. Each entry is written to
 | {start: {line: 2745, column: 57}, end: {line: 2747, column: 1}} |  |
| code_inline | ~/.local/share/flatpak/overrides/<name> | {start: {line: 2747, column: 1}, end: {line: 2747, column: 44}} |  |
| text |  in Flatpak’s INI format. | {start: {line: 2747, column: 44}, end: {line: 2747, column: 72}} |  |
| text | Type: | {start: {line: 2751, column: 2}, end: {line: 2751, column: 7}} |  |
| text | 
attribute set of (JSON value) | {start: {line: 2751, column: 8}, end: {line: 2752, column: 30}} |  |
| text | Default: | {start: {line: 2756, column: 2}, end: {line: 2756, column: 10}} |  |
| text | Example: | {start: {line: 2764, column: 2}, end: {line: 2764, column: 10}} |  |
| text | Declared by: | {start: {line: 2777, column: 2}, end: {line: 2777, column: 14}} |  |
| text | Whether to enable GUI packages. | {start: {line: 2786, column: 1}, end: {line: 2786, column: 33}} |  |
| text | Type: | {start: {line: 2790, column: 2}, end: {line: 2790, column: 7}} |  |
| text | 
boolean | {start: {line: 2790, column: 8}, end: {line: 2791, column: 8}} |  |
| text | Default: | {start: {line: 2795, column: 2}, end: {line: 2795, column: 10}} |  |
| text | Example: | {start: {line: 2803, column: 2}, end: {line: 2803, column: 10}} |  |
| text | Declared by: | {start: {line: 2809, column: 2}, end: {line: 2809, column: 14}} |  |
| text | Whether to enable GNOME components. | {start: {line: 2818, column: 1}, end: {line: 2818, column: 37}} |  |
| text | Type: | {start: {line: 2822, column: 2}, end: {line: 2822, column: 7}} |  |
| text | 
boolean | {start: {line: 2822, column: 8}, end: {line: 2823, column: 8}} |  |
| text | Default: | {start: {line: 2827, column: 2}, end: {line: 2827, column: 10}} |  |
| text | Example: | {start: {line: 2835, column: 2}, end: {line: 2835, column: 10}} |  |
| text | Declared by: | {start: {line: 2841, column: 2}, end: {line: 2841, column: 14}} |  |
| text | Whether to enable KDE components. | {start: {line: 2850, column: 1}, end: {line: 2850, column: 35}} |  |
| text | Type: | {start: {line: 2854, column: 2}, end: {line: 2854, column: 7}} |  |
| text | 
boolean | {start: {line: 2854, column: 8}, end: {line: 2855, column: 8}} |  |
| text | Default: | {start: {line: 2859, column: 2}, end: {line: 2859, column: 10}} |  |
| text | Example: | {start: {line: 2867, column: 2}, end: {line: 2867, column: 10}} |  |
| text | Declared by: | {start: {line: 2873, column: 2}, end: {line: 2873, column: 14}} |  |
| text | Whether to enable libre office. | {start: {line: 2882, column: 1}, end: {line: 2882, column: 33}} |  |
| text | Type: | {start: {line: 2886, column: 2}, end: {line: 2886, column: 7}} |  |
| text | 
boolean | {start: {line: 2886, column: 8}, end: {line: 2887, column: 8}} |  |
| text | Default: | {start: {line: 2891, column: 2}, end: {line: 2891, column: 10}} |  |
| text | Example: | {start: {line: 2899, column: 2}, end: {line: 2899, column: 10}} |  |
| text | Declared by: | {start: {line: 2905, column: 2}, end: {line: 2905, column: 14}} |  |
| text | Whether to manage the Noctalia config. | {start: {line: 2914, column: 1}, end: {line: 2914, column: 40}} |  |
| text | Type: | {start: {line: 2918, column: 2}, end: {line: 2918, column: 7}} |  |
| text | 
boolean | {start: {line: 2918, column: 8}, end: {line: 2919, column: 8}} |  |
| text | Default: | {start: {line: 2923, column: 2}, end: {line: 2923, column: 10}} |  |
| text | Example: | {start: {line: 2931, column: 2}, end: {line: 2931, column: 10}} |  |
| text | Declared by: | {start: {line: 2937, column: 2}, end: {line: 2937, column: 14}} |  |
| text | 声明式的 noctalia bar | {start: {line: 2946, column: 1}, end: {line: 2946, column: 26}} |  |
| text | Type: | {start: {line: 2950, column: 2}, end: {line: 2950, column: 7}} |  |
| text | 
attribute set of (submodule) | {start: {line: 2950, column: 8}, end: {line: 2951, column: 29}} |  |
| text | Default: | {start: {line: 2955, column: 2}, end: {line: 2955, column: 10}} |  |
| text | Declared by: | {start: {line: 2961, column: 2}, end: {line: 2961, column: 14}} |  |
| text | bar 中间段的组件 | {start: {line: 2970, column: 1}, end: {line: 2970, column: 23}} |  |
| text | Type: | {start: {line: 2974, column: 2}, end: {line: 2974, column: 7}} |  |
| text | 
list of (open submodule of attribute set of (TOML value)) | {start: {line: 2974, column: 8}, end: {line: 2975, column: 58}} |  |
| text | Declared by: | {start: {line: 2977, column: 2}, end: {line: 2977, column: 14}} |  |
| text | widget 的类型，例如  | {start: {line: 2986, column: 1}, end: {line: 2986, column: 27}} |  |
| code_inline | launcher | {start: {line: 2986, column: 27}, end: {line: 2986, column: 39}} |  |
| text | ,  | {start: {line: 2986, column: 39}, end: {line: 2986, column: 41}} |  |
| code_inline | tray | {start: {line: 2986, column: 41}, end: {line: 2986, column: 49}} |  |
| text |  等 | {start: {line: 2986, column: 49}, end: {line: 2986, column: 53}} |  |
| text | Type: | {start: {line: 2990, column: 2}, end: {line: 2990, column: 7}} |  |
| text | 
string | {start: {line: 2990, column: 8}, end: {line: 2991, column: 7}} |  |
| text | Declared by: | {start: {line: 2993, column: 2}, end: {line: 2993, column: 14}} |  |
| text | bar 末尾段的组件 | {start: {line: 3002, column: 1}, end: {line: 3002, column: 23}} |  |
| text | Type: | {start: {line: 3006, column: 2}, end: {line: 3006, column: 7}} |  |
| text | 
list of (open submodule of attribute set of (TOML value)) | {start: {line: 3006, column: 8}, end: {line: 3007, column: 58}} |  |
| text | Declared by: | {start: {line: 3009, column: 2}, end: {line: 3009, column: 14}} |  |
| text | widget 的类型，例如  | {start: {line: 3018, column: 1}, end: {line: 3018, column: 27}} |  |
| code_inline | launcher | {start: {line: 3018, column: 27}, end: {line: 3018, column: 39}} |  |
| text | ,  | {start: {line: 3018, column: 39}, end: {line: 3018, column: 41}} |  |
| code_inline | tray | {start: {line: 3018, column: 41}, end: {line: 3018, column: 49}} |  |
| text |  等 | {start: {line: 3018, column: 49}, end: {line: 3018, column: 53}} |  |
| text | Type: | {start: {line: 3022, column: 2}, end: {line: 3022, column: 7}} |  |
| text | 
string | {start: {line: 3022, column: 8}, end: {line: 3023, column: 7}} |  |
| text | Declared by: | {start: {line: 3025, column: 2}, end: {line: 3025, column: 14}} |  |
| text | bar 的设置 | {start: {line: 3034, column: 1}, end: {line: 3034, column: 14}} |  |
| text | Type: | {start: {line: 3038, column: 2}, end: {line: 3038, column: 7}} |  |
| text | 
TOML value | {start: {line: 3038, column: 8}, end: {line: 3039, column: 11}} |  |
| text | Declared by: | {start: {line: 3041, column: 2}, end: {line: 3041, column: 14}} |  |
| text | bar 前段的组件 | {start: {line: 3050, column: 1}, end: {line: 3050, column: 20}} |  |
| text | Type: | {start: {line: 3054, column: 2}, end: {line: 3054, column: 7}} |  |
| text | 
list of (open submodule of attribute set of (TOML value)) | {start: {line: 3054, column: 8}, end: {line: 3055, column: 58}} |  |
| text | Declared by: | {start: {line: 3057, column: 2}, end: {line: 3057, column: 14}} |  |
| text | widget 的类型，例如  | {start: {line: 3066, column: 1}, end: {line: 3066, column: 27}} |  |
| code_inline | launcher | {start: {line: 3066, column: 27}, end: {line: 3066, column: 39}} |  |
| text | ,  | {start: {line: 3066, column: 39}, end: {line: 3066, column: 41}} |  |
| code_inline | tray | {start: {line: 3066, column: 41}, end: {line: 3066, column: 49}} |  |
| text |  等 | {start: {line: 3066, column: 49}, end: {line: 3066, column: 53}} |  |
| text | Type: | {start: {line: 3070, column: 2}, end: {line: 3070, column: 7}} |  |
| text | 
string | {start: {line: 3070, column: 8}, end: {line: 3071, column: 7}} |  |
| text | Declared by: | {start: {line: 3073, column: 2}, end: {line: 3073, column: 14}} |  |
| text | Structured config written to  | {start: {line: 3082, column: 1}, end: {line: 3082, column: 30}} |  |
| code_inline | ~/.config/noctalia/config.toml | {start: {line: 3082, column: 30}, end: {line: 3082, column: 64}} |  |
| text |  via
 | {start: {line: 3082, column: 64}, end: {line: 3083, column: 1}} |  |
| code_inline | pkgs.formats.toml | {start: {line: 3083, column: 1}, end: {line: 3083, column: 22}} |  |
| text |  (nested attrsets become TOML tables and lists of
attrsets become arrays of tables). | {start: {line: 3083, column: 22}, end: {line: 3084, column: 36}} |  |
| text | Noctalia reads every  | {start: {line: 3086, column: 1}, end: {line: 3086, column: 22}} |  |
| code_inline | *.toml | {start: {line: 3086, column: 22}, end: {line: 3086, column: 32}} |  |
| text |  directly in that folder (sorted
alphabetically) and merges them; GUI-side overrides are kept separately
in the app-managed  | {start: {line: 3086, column: 32}, end: {line: 3088, column: 20}} |  |
| code_inline | ~/.local/state/noctalia/settings.toml | {start: {line: 3088, column: 20}, end: {line: 3088, column: 61}} |  |
| text | , which is
loaded last and wins. | {start: {line: 3088, column: 61}, end: {line: 3089, column: 23}} |  |
| text | See  | {start: {line: 3091, column: 1}, end: {line: 3091, column: 5}} |  |
| text |  for the schema. | {start: {line: 3091, column: 56}, end: {line: 3091, column: 73}} |  |
| text | Type: | {start: {line: 3095, column: 2}, end: {line: 3095, column: 7}} |  |
| text | 
TOML value | {start: {line: 3095, column: 8}, end: {line: 3096, column: 11}} |  |
| text | Default: | {start: {line: 3100, column: 2}, end: {line: 3100, column: 10}} |  |
| text | Example: | {start: {line: 3108, column: 2}, end: {line: 3108, column: 10}} |  |
| text | Declared by: | {start: {line: 3123, column: 2}, end: {line: 3123, column: 14}} |  |
| text | Whether to enable v2rayn, a GUI for v2ray. | {start: {line: 3132, column: 1}, end: {line: 3132, column: 44}} |  |
| text | Type: | {start: {line: 3136, column: 2}, end: {line: 3136, column: 7}} |  |
| text | 
boolean | {start: {line: 3136, column: 8}, end: {line: 3137, column: 8}} |  |
| text | Default: | {start: {line: 3141, column: 2}, end: {line: 3141, column: 10}} |  |
| text | Example: | {start: {line: 3149, column: 2}, end: {line: 3149, column: 10}} |  |
| text | Declared by: | {start: {line: 3155, column: 2}, end: {line: 3155, column: 14}} |  |
| text | Whether to enable vicinae. | {start: {line: 3164, column: 1}, end: {line: 3164, column: 28}} |  |
| text | Type: | {start: {line: 3168, column: 2}, end: {line: 3168, column: 7}} |  |
| text | 
boolean | {start: {line: 3168, column: 8}, end: {line: 3169, column: 8}} |  |
| text | Default: | {start: {line: 3173, column: 2}, end: {line: 3173, column: 10}} |  |
| text | Example: | {start: {line: 3181, column: 2}, end: {line: 3181, column: 10}} |  |
| text | Declared by: | {start: {line: 3187, column: 2}, end: {line: 3187, column: 14}} |  |
| text | vicinae settings | {start: {line: 3196, column: 1}, end: {line: 3196, column: 17}} |  |
| text | Type: | {start: {line: 3200, column: 2}, end: {line: 3200, column: 7}} |  |
| text | 
JSON value | {start: {line: 3200, column: 8}, end: {line: 3201, column: 11}} |  |
| text | Default: | {start: {line: 3205, column: 2}, end: {line: 3205, column: 10}} |  |
| text | Declared by: | {start: {line: 3211, column: 2}, end: {line: 3211, column: 14}} |  |
| text | Whether to enable vicinae systemd service. | {start: {line: 3220, column: 1}, end: {line: 3220, column: 44}} |  |
| text | Type: | {start: {line: 3224, column: 2}, end: {line: 3224, column: 7}} |  |
| text | 
boolean | {start: {line: 3224, column: 8}, end: {line: 3225, column: 8}} |  |
| text | Default: | {start: {line: 3229, column: 2}, end: {line: 3229, column: 10}} |  |
| text | Example: | {start: {line: 3237, column: 2}, end: {line: 3237, column: 10}} |  |
| text | Declared by: | {start: {line: 3243, column: 2}, end: {line: 3243, column: 14}} |  |
| text | Whether to enable Zen Browser. | {start: {line: 3252, column: 1}, end: {line: 3252, column: 32}} |  |
| text | Type: | {start: {line: 3256, column: 2}, end: {line: 3256, column: 7}} |  |
| text | 
boolean | {start: {line: 3256, column: 8}, end: {line: 3257, column: 8}} |  |
| text | Default: | {start: {line: 3261, column: 2}, end: {line: 3261, column: 10}} |  |
| text | Example: | {start: {line: 3269, column: 2}, end: {line: 3269, column: 10}} |  |
| text | Declared by: | {start: {line: 3275, column: 2}, end: {line: 3275, column: 14}} |  |
| text | Whether to enable Zen Browser to be the default browser. | {start: {line: 3284, column: 1}, end: {line: 3284, column: 58}} |  |
| text | Type: | {start: {line: 3288, column: 2}, end: {line: 3288, column: 7}} |  |
| text | 
boolean | {start: {line: 3288, column: 8}, end: {line: 3289, column: 8}} |  |
| text | Default: | {start: {line: 3293, column: 2}, end: {line: 3293, column: 10}} |  |
| text | Example: | {start: {line: 3301, column: 2}, end: {line: 3301, column: 10}} |  |
| text | Declared by: | {start: {line: 3307, column: 2}, end: {line: 3307, column: 14}} |  |
| text | Whether to enable cpp SDK. | {start: {line: 3316, column: 1}, end: {line: 3316, column: 28}} |  |
| text | Type: | {start: {line: 3320, column: 2}, end: {line: 3320, column: 7}} |  |
| text | 
boolean | {start: {line: 3320, column: 8}, end: {line: 3321, column: 8}} |  |
| text | Default: | {start: {line: 3325, column: 2}, end: {line: 3325, column: 10}} |  |
| text | Example: | {start: {line: 3333, column: 2}, end: {line: 3333, column: 10}} |  |
| text | Declared by: | {start: {line: 3339, column: 2}, end: {line: 3339, column: 14}} |  |
| text | Whether to enable javascript/typescript SDK. | {start: {line: 3348, column: 1}, end: {line: 3348, column: 46}} |  |
| text | Type: | {start: {line: 3352, column: 2}, end: {line: 3352, column: 7}} |  |
| text | 
boolean | {start: {line: 3352, column: 8}, end: {line: 3353, column: 8}} |  |
| text | Default: | {start: {line: 3357, column: 2}, end: {line: 3357, column: 10}} |  |
| text | Example: | {start: {line: 3365, column: 2}, end: {line: 3365, column: 10}} |  |
| text | Declared by: | {start: {line: 3371, column: 2}, end: {line: 3371, column: 14}} |  |
| text | Whether to enable bun runtime. | {start: {line: 3380, column: 1}, end: {line: 3380, column: 32}} |  |
| text | Type: | {start: {line: 3384, column: 2}, end: {line: 3384, column: 7}} |  |
| text | 
boolean | {start: {line: 3384, column: 8}, end: {line: 3385, column: 8}} |  |
| text | Default: | {start: {line: 3389, column: 2}, end: {line: 3389, column: 10}} |  |
| text | Example: | {start: {line: 3397, column: 2}, end: {line: 3397, column: 10}} |  |
| text | Declared by: | {start: {line: 3403, column: 2}, end: {line: 3403, column: 14}} |  |
| text | Whether to enable nodejs runtime. | {start: {line: 3412, column: 1}, end: {line: 3412, column: 35}} |  |
| text | Type: | {start: {line: 3416, column: 2}, end: {line: 3416, column: 7}} |  |
| text | 
boolean | {start: {line: 3416, column: 8}, end: {line: 3417, column: 8}} |  |
| text | Default: | {start: {line: 3421, column: 2}, end: {line: 3421, column: 10}} |  |
| text | Example: | {start: {line: 3429, column: 2}, end: {line: 3429, column: 10}} |  |
| text | Declared by: | {start: {line: 3435, column: 2}, end: {line: 3435, column: 14}} |  |
| text | Whether to enable nix SDK. | {start: {line: 3444, column: 1}, end: {line: 3444, column: 28}} |  |
| text | Type: | {start: {line: 3448, column: 2}, end: {line: 3448, column: 7}} |  |
| text | 
boolean | {start: {line: 3448, column: 8}, end: {line: 3449, column: 8}} |  |
| text | Default: | {start: {line: 3453, column: 2}, end: {line: 3453, column: 10}} |  |
| text | Example: | {start: {line: 3461, column: 2}, end: {line: 3461, column: 10}} |  |
| text | Declared by: | {start: {line: 3467, column: 2}, end: {line: 3467, column: 14}} |  |
| text | Whether to enable python SDK. | {start: {line: 3476, column: 1}, end: {line: 3476, column: 31}} |  |
| text | Type: | {start: {line: 3480, column: 2}, end: {line: 3480, column: 7}} |  |
| text | 
boolean | {start: {line: 3480, column: 8}, end: {line: 3481, column: 8}} |  |
| text | Default: | {start: {line: 3485, column: 2}, end: {line: 3485, column: 10}} |  |
| text | Example: | {start: {line: 3493, column: 2}, end: {line: 3493, column: 10}} |  |
| text | Declared by: | {start: {line: 3499, column: 2}, end: {line: 3499, column: 14}} |  |
| text | 使用 nushell 的 merge deep 命令将 Nix 生成的 JSON 文件与指定 path 的文件进行深度合并。 | {start: {line: 3508, column: 1}, end: {line: 3508, column: 111}} |  |
| text | Type: | {start: {line: 3512, column: 2}, end: {line: 3512, column: 7}} |  |
| text | 
attribute set of (JSON value) | {start: {line: 3512, column: 8}, end: {line: 3513, column: 30}} |  |
| text | Default: | {start: {line: 3517, column: 2}, end: {line: 3517, column: 10}} |  |
| text | Declared by: | {start: {line: 3523, column: 2}, end: {line: 3523, column: 14}} |  |
| text | Whether to enable 现代化的 CLI 工具，包括 fzf, ripgrep 等 | {start: {line: 3532, column: 1}, end: {line: 3532, column: 68}} |  |
| text | Type: | {start: {line: 3545, column: 2}, end: {line: 3545, column: 7}} |  |
| text | 
boolean | {start: {line: 3545, column: 8}, end: {line: 3546, column: 8}} |  |
| text | Default: | {start: {line: 3550, column: 2}, end: {line: 3550, column: 10}} |  |
| text | Example: | {start: {line: 3558, column: 2}, end: {line: 3558, column: 10}} |  |
| text | Declared by: | {start: {line: 3564, column: 2}, end: {line: 3564, column: 14}} |  |
| text | Whether to enable DeepSeek Harness（dsh）的 package. | {start: {line: 3573, column: 1}, end: {line: 3573, column: 57}} |  |
| text | Type: | {start: {line: 3577, column: 2}, end: {line: 3577, column: 7}} |  |
| text | 
boolean | {start: {line: 3577, column: 8}, end: {line: 3578, column: 8}} |  |
| text | Default: | {start: {line: 3582, column: 2}, end: {line: 3582, column: 10}} |  |
| text | Example: | {start: {line: 3590, column: 2}, end: {line: 3590, column: 10}} |  |
| text | Declared by: | {start: {line: 3596, column: 2}, end: {line: 3596, column: 14}} |  |
| text | systemd  | {start: {line: 3605, column: 1}, end: {line: 3605, column: 9}} |  |
| code_inline | EnvironmentFile | {start: {line: 3605, column: 9}, end: {line: 3605, column: 28}} |  |
| text |  列表，每行  | {start: {line: 3605, column: 28}, end: {line: 3605, column: 45}} |  |
| code_inline | KEY=VALUE | {start: {line: 3605, column: 45}, end: {line: 3605, column: 58}} |  |
| text | 。适合放 sops 模板等不宜
进 Nix store 的机密。 | {start: {line: 3605, column: 58}, end: {line: 3606, column: 27}} |  |
| text | Type: | {start: {line: 3610, column: 2}, end: {line: 3610, column: 7}} |  |
| text | 
list of (string or absolute path) | {start: {line: 3610, column: 8}, end: {line: 3611, column: 34}} |  |
| text | Default: | {start: {line: 3615, column: 2}, end: {line: 3615, column: 10}} |  |
| text | Example: | {start: {line: 3623, column: 2}, end: {line: 3623, column: 10}} |  |
| text | Declared by: | {start: {line: 3630, column: 2}, end: {line: 3630, column: 14}} |  |
| text | 追加到  | {start: {line: 3639, column: 1}, end: {line: 3639, column: 11}} |  |
| code_inline | dsh web --no-open | {start: {line: 3639, column: 11}, end: {line: 3639, column: 32}} |  |
| text |  之后的启动参数，例如  | {start: {line: 3639, column: 32}, end: {line: 3639, column: 64}} |  |
| code_inline | --host | {start: {line: 3639, column: 64}, end: {line: 3639, column: 74}} |  |
| text | 、 | {start: {line: 3639, column: 74}, end: {line: 3639, column: 77}} |  |
| code_inline | --port | {start: {line: 3639, column: 77}, end: {line: 3639, column: 87}} |  |
| text | 。 | {start: {line: 3639, column: 87}, end: {line: 3639, column: 90}} |  |
| text | Type: | {start: {line: 3643, column: 2}, end: {line: 3643, column: 7}} |  |
| text | 
list of string | {start: {line: 3643, column: 8}, end: {line: 3644, column: 15}} |  |
| text | Default: | {start: {line: 3648, column: 2}, end: {line: 3648, column: 10}} |  |
| text | Example: | {start: {line: 3656, column: 2}, end: {line: 3656, column: 10}} |  |
| text | Declared by: | {start: {line: 3663, column: 2}, end: {line: 3663, column: 14}} |  |
| text | Whether to enable systemd service for dsh-web. | {start: {line: 3672, column: 1}, end: {line: 3672, column: 48}} |  |
| text | Type: | {start: {line: 3676, column: 2}, end: {line: 3676, column: 7}} |  |
| text | 
boolean | {start: {line: 3676, column: 8}, end: {line: 3677, column: 8}} |  |
| text | Default: | {start: {line: 3681, column: 2}, end: {line: 3681, column: 10}} |  |
| text | Example: | {start: {line: 3689, column: 2}, end: {line: 3689, column: 10}} |  |
| text | Declared by: | {start: {line: 3695, column: 2}, end: {line: 3695, column: 14}} |  |
| text | Whether to enable pi coding agent. | {start: {line: 3704, column: 1}, end: {line: 3704, column: 36}} |  |
| text | Type: | {start: {line: 3708, column: 2}, end: {line: 3708, column: 7}} |  |
| text | 
boolean | {start: {line: 3708, column: 8}, end: {line: 3709, column: 8}} |  |
| text | Default: | {start: {line: 3713, column: 2}, end: {line: 3713, column: 10}} |  |
| text | Example: | {start: {line: 3721, column: 2}, end: {line: 3721, column: 10}} |  |
| text | Declared by: | {start: {line: 3727, column: 2}, end: {line: 3727, column: 14}} |  |
| text | auth keys for pi | {start: {line: 3736, column: 1}, end: {line: 3736, column: 17}} |  |
| text | Type: | {start: {line: 3740, column: 2}, end: {line: 3740, column: 7}} |  |
| text | 
attribute set of (submodule) | {start: {line: 3740, column: 8}, end: {line: 3741, column: 29}} |  |
| text | Declared by: | {start: {line: 3743, column: 2}, end: {line: 3743, column: 14}} |  |
| text | API key 的实际存储位置。可以是 sops 的路径。 | {start: {line: 3752, column: 1}, end: {line: 3752, column: 60}} |  |
| text | Type: | {start: {line: 3756, column: 2}, end: {line: 3756, column: 7}} |  |
| text | 
string | {start: {line: 3756, column: 8}, end: {line: 3757, column: 7}} |  |
| text | Declared by: | {start: {line: 3759, column: 2}, end: {line: 3759, column: 14}} |  |
| text | auth type | {start: {line: 3768, column: 1}, end: {line: 3768, column: 10}} |  |
| text | Type: | {start: {line: 3772, column: 2}, end: {line: 3772, column: 7}} |  |
| text | 
value “api_key” (singular enum) | {start: {line: 3772, column: 8}, end: {line: 3773, column: 36}} |  |
| text | Declared by: | {start: {line: 3775, column: 2}, end: {line: 3775, column: 14}} |  |
| text | pi settings.json content (merged into ~/.pi/agent/settings.json) | {start: {line: 3784, column: 1}, end: {line: 3784, column: 68}} |  |
| text | Type: | {start: {line: 3788, column: 2}, end: {line: 3788, column: 7}} |  |
| text | 
open submodule of attribute set of (JSON value) | {start: {line: 3788, column: 8}, end: {line: 3789, column: 48}} |  |
| text | Declared by: | {start: {line: 3791, column: 2}, end: {line: 3791, column: 14}} |  |
| text | packages of pi | {start: {line: 3800, column: 1}, end: {line: 3800, column: 15}} |  |
| text | Type: | {start: {line: 3804, column: 2}, end: {line: 3804, column: 7}} |  |
| text | 
list of string | {start: {line: 3804, column: 8}, end: {line: 3805, column: 15}} |  |
| text | Default: | {start: {line: 3809, column: 2}, end: {line: 3809, column: 10}} |  |
| text | Declared by: | {start: {line: 3815, column: 2}, end: {line: 3815, column: 14}} |  |
| text | Whether to enable 使得一些软件变得透明. | {start: {line: 3824, column: 1}, end: {line: 3824, column: 51}} |  |
| text | Type: | {start: {line: 3828, column: 2}, end: {line: 3828, column: 7}} |  |
| text | 
boolean | {start: {line: 3828, column: 8}, end: {line: 3829, column: 8}} |  |
| text | Default: | {start: {line: 3833, column: 2}, end: {line: 3833, column: 10}} |  |
| text | Example: | {start: {line: 3841, column: 2}, end: {line: 3841, column: 10}} |  |
| text | Declared by: | {start: {line: 3847, column: 2}, end: {line: 3847, column: 14}} |  |
| text | Whether to enable 只有终端是透明的. | {start: {line: 3856, column: 1}, end: {line: 3856, column: 45}} |  |
| text | Type: | {start: {line: 3860, column: 2}, end: {line: 3860, column: 7}} |  |
| text | 
boolean | {start: {line: 3860, column: 8}, end: {line: 3861, column: 8}} |  |
| text | Default: | {start: {line: 3865, column: 2}, end: {line: 3865, column: 10}} |  |
| text | Example: | {start: {line: 3873, column: 2}, end: {line: 3873, column: 10}} |  |
| text | Declared by: | {start: {line: 3879, column: 2}, end: {line: 3879, column: 14}} |  |
| text | 透明度 | {start: {line: 3888, column: 1}, end: {line: 3888, column: 10}} |  |
| text | Type: | {start: {line: 3892, column: 2}, end: {line: 3892, column: 7}} |  |
| text | 
floating point number | {start: {line: 3892, column: 8}, end: {line: 3893, column: 22}} |  |
| text | Default: | {start: {line: 3897, column: 2}, end: {line: 3897, column: 10}} |  |
| text | Declared by: | {start: {line: 3903, column: 2}, end: {line: 3903, column: 14}} |  |
| text | Whether to enable Wine. | {start: {line: 3912, column: 1}, end: {line: 3912, column: 25}} |  |
| text | Type: | {start: {line: 3916, column: 2}, end: {line: 3916, column: 7}} |  |
| text | 
boolean | {start: {line: 3916, column: 8}, end: {line: 3917, column: 8}} |  |
| text | Default: | {start: {line: 3921, column: 2}, end: {line: 3921, column: 10}} |  |
| text | Example: | {start: {line: 3929, column: 2}, end: {line: 3929, column: 10}} |  |
| text | Declared by: | {start: {line: 3935, column: 2}, end: {line: 3935, column: 14}} |  |
| text | default applications for these MIME:
application/x-tar | {start: {line: 3944, column: 1}, end: {line: 3945, column: 18}} |  |
| text | Type: | {start: {line: 3954, column: 2}, end: {line: 3954, column: 7}} |  |
| text | 
list of string | {start: {line: 3954, column: 8}, end: {line: 3955, column: 15}} |  |
| text | Default: | {start: {line: 3959, column: 2}, end: {line: 3959, column: 10}} |  |
| text | Declared by: | {start: {line: 3965, column: 2}, end: {line: 3965, column: 14}} |  |
| text | default applications for these MIME:
audio/x-vorbis+ogg | {start: {line: 3974, column: 1}, end: {line: 3975, column: 19}} |  |
| text | Type: | {start: {line: 4049, column: 2}, end: {line: 4049, column: 7}} |  |
| text | 
list of string | {start: {line: 4049, column: 8}, end: {line: 4050, column: 15}} |  |
| text | Default: | {start: {line: 4054, column: 2}, end: {line: 4054, column: 10}} |  |
| text | Declared by: | {start: {line: 4060, column: 2}, end: {line: 4060, column: 14}} |  |
| text | default applications for these MIME:
application/epub+zip | {start: {line: 4069, column: 1}, end: {line: 4070, column: 21}} |  |
| text | Type: | {start: {line: 4080, column: 2}, end: {line: 4080, column: 7}} |  |
| text | 
list of string | {start: {line: 4080, column: 8}, end: {line: 4081, column: 15}} |  |
| text | Default: | {start: {line: 4085, column: 2}, end: {line: 4085, column: 10}} |  |
| text | Declared by: | {start: {line: 4091, column: 2}, end: {line: 4091, column: 14}} |  |
| text | default applications for these MIME:
application/vnd.ms-excel | {start: {line: 4100, column: 1}, end: {line: 4101, column: 26}} |  |
| text | Type: | {start: {line: 4112, column: 2}, end: {line: 4112, column: 7}} |  |
| text | 
list of string | {start: {line: 4112, column: 8}, end: {line: 4113, column: 15}} |  |
| text | Default: | {start: {line: 4117, column: 2}, end: {line: 4117, column: 10}} |  |
| text | Declared by: | {start: {line: 4123, column: 2}, end: {line: 4123, column: 14}} |  |
| text | default applications for these MIME:
inode/directory | {start: {line: 4132, column: 1}, end: {line: 4133, column: 16}} |  |
| text | Type: | {start: {line: 4139, column: 2}, end: {line: 4139, column: 7}} |  |
| text | 
list of string | {start: {line: 4139, column: 8}, end: {line: 4140, column: 15}} |  |
| text | Default: | {start: {line: 4144, column: 2}, end: {line: 4144, column: 10}} |  |
| text | Declared by: | {start: {line: 4150, column: 2}, end: {line: 4150, column: 14}} |  |
| text | default applications for these MIME:
image/jpeg | {start: {line: 4159, column: 1}, end: {line: 4160, column: 11}} |  |
| text | Type: | {start: {line: 4188, column: 2}, end: {line: 4188, column: 7}} |  |
| text | 
list of string | {start: {line: 4188, column: 8}, end: {line: 4189, column: 15}} |  |
| text | Default: | {start: {line: 4193, column: 2}, end: {line: 4193, column: 10}} |  |
| text | Declared by: | {start: {line: 4199, column: 2}, end: {line: 4199, column: 14}} |  |
| text | default applications for these MIME:
x-scheme-handler/mailto | {start: {line: 4208, column: 1}, end: {line: 4209, column: 24}} |  |
| text | Type: | {start: {line: 4213, column: 2}, end: {line: 4213, column: 7}} |  |
| text | 
list of string | {start: {line: 4213, column: 8}, end: {line: 4214, column: 15}} |  |
| text | Default: | {start: {line: 4218, column: 2}, end: {line: 4218, column: 10}} |  |
| text | Declared by: | {start: {line: 4224, column: 2}, end: {line: 4224, column: 14}} |  |
| text | default applications for these MIME:
application/vnd.ms-powerpoint | {start: {line: 4233, column: 1}, end: {line: 4234, column: 31}} |  |
| text | Type: | {start: {line: 4246, column: 2}, end: {line: 4246, column: 7}} |  |
| text | 
list of string | {start: {line: 4246, column: 8}, end: {line: 4247, column: 15}} |  |
| text | Default: | {start: {line: 4251, column: 2}, end: {line: 4251, column: 10}} |  |
| text | Declared by: | {start: {line: 4257, column: 2}, end: {line: 4257, column: 14}} |  |
| text | default applications for these MIME:
video/x-ogm+ogg | {start: {line: 4266, column: 1}, end: {line: 4267, column: 16}} |  |
| text | Type: | {start: {line: 4314, column: 2}, end: {line: 4314, column: 7}} |  |
| text | 
list of string | {start: {line: 4314, column: 8}, end: {line: 4315, column: 15}} |  |
| text | Default: | {start: {line: 4319, column: 2}, end: {line: 4319, column: 10}} |  |
| text | Declared by: | {start: {line: 4325, column: 2}, end: {line: 4325, column: 14}} |  |
| text | default applications for these MIME:
x-scheme-handler/http | {start: {line: 4334, column: 1}, end: {line: 4335, column: 22}} |  |
| text | Type: | {start: {line: 4348, column: 2}, end: {line: 4348, column: 7}} |  |
| text | 
list of string | {start: {line: 4348, column: 8}, end: {line: 4349, column: 15}} |  |
| text | Default: | {start: {line: 4353, column: 2}, end: {line: 4353, column: 10}} |  |
| text | Declared by: | {start: {line: 4359, column: 2}, end: {line: 4359, column: 14}} |  |
| text | default applications for these MIME:
application/msword | {start: {line: 4368, column: 1}, end: {line: 4369, column: 19}} |  |
| text | Type: | {start: {line: 4378, column: 2}, end: {line: 4378, column: 7}} |  |
| text | 
list of string | {start: {line: 4378, column: 8}, end: {line: 4379, column: 15}} |  |
| text | Default: | {start: {line: 4383, column: 2}, end: {line: 4383, column: 10}} |  |
| text | Declared by: | {start: {line: 4389, column: 2}, end: {line: 4389, column: 14}} |  |
| text | 整个配置文件夹被安装在哪里 | {start: {line: 4398, column: 1}, end: {line: 4398, column: 40}} |  |
| text | Type: | {start: {line: 4402, column: 2}, end: {line: 4402, column: 7}} |  |
| text | 
string | {start: {line: 4402, column: 8}, end: {line: 4403, column: 7}} |  |
| text | Default: | {start: {line: 4407, column: 2}, end: {line: 4407, column: 10}} |  |
| text | Declared by: | {start: {line: 4414, column: 2}, end: {line: 4414, column: 14}} |  |
| text | Whether to enable 当这台机器上有自己 …/trust/linca.pk.asc 对应的私钥的时候启用
. | {start: {line: 4421, column: 1}, end: {line: 4422, column: 3}} |  |
| text | Type: | {start: {line: 4426, column: 2}, end: {line: 4426, column: 7}} |  |
| text | 
boolean | {start: {line: 4426, column: 8}, end: {line: 4427, column: 8}} |  |
| text | Default: | {start: {line: 4431, column: 2}, end: {line: 4431, column: 10}} |  |
| text | Example: | {start: {line: 4439, column: 2}, end: {line: 4439, column: 10}} |  |
| text | Declared by: | {start: {line: 4445, column: 2}, end: {line: 4445, column: 14}} |  |
| text | Whether to enable packages for play. | {start: {line: 4454, column: 1}, end: {line: 4454, column: 38}} |  |
| text | Type: | {start: {line: 4458, column: 2}, end: {line: 4458, column: 7}} |  |
| text | 
boolean | {start: {line: 4458, column: 8}, end: {line: 4459, column: 8}} |  |
| text | Default: | {start: {line: 4463, column: 2}, end: {line: 4463, column: 10}} |  |
| text | Example: | {start: {line: 4471, column: 2}, end: {line: 4471, column: 10}} |  |
| text | Declared by: | {start: {line: 4477, column: 2}, end: {line: 4477, column: 14}} |  |
| text | Whether to enable connect to my personal webdav and etc. | {start: {line: 4486, column: 1}, end: {line: 4486, column: 58}} |  |
| text | Type: | {start: {line: 4490, column: 2}, end: {line: 4490, column: 7}} |  |
| text | 
boolean | {start: {line: 4490, column: 8}, end: {line: 4491, column: 8}} |  |
| text | Default: | {start: {line: 4495, column: 2}, end: {line: 4495, column: 10}} |  |
| text | Example: | {start: {line: 4503, column: 2}, end: {line: 4503, column: 10}} |  |
| text | Declared by: | {start: {line: 4509, column: 2}, end: {line: 4509, column: 14}} |  |
| text | Whether to enable SOPS configs. | {start: {line: 4518, column: 1}, end: {line: 4518, column: 33}} |  |
| text | Type: | {start: {line: 4522, column: 2}, end: {line: 4522, column: 7}} |  |
| text | 
boolean | {start: {line: 4522, column: 8}, end: {line: 4523, column: 8}} |  |
| text | Default: | {start: {line: 4527, column: 2}, end: {line: 4527, column: 10}} |  |
| text | Example: | {start: {line: 4535, column: 2}, end: {line: 4535, column: 10}} |  |
| text | Declared by: | {start: {line: 4541, column: 2}, end: {line: 4541, column: 14}} |  |
| text | Whether to enable LaTeX toolchain (tectonic + TeX Live/latexmk). | {start: {line: 4550, column: 1}, end: {line: 4550, column: 66}} |  |
| text | Type: | {start: {line: 4554, column: 2}, end: {line: 4554, column: 7}} |  |
| text | 
boolean | {start: {line: 4554, column: 8}, end: {line: 4555, column: 8}} |  |
| text | Default: | {start: {line: 4559, column: 2}, end: {line: 4559, column: 10}} |  |
| text | Example: | {start: {line: 4567, column: 2}, end: {line: 4567, column: 10}} |  |
| text | Declared by: | {start: {line: 4573, column: 2}, end: {line: 4573, column: 14}} |  |
| text | Whether to enable packages for work. | {start: {line: 4582, column: 1}, end: {line: 4582, column: 38}} |  |
| text | Type: | {start: {line: 4586, column: 2}, end: {line: 4586, column: 7}} |  |
| text | 
boolean | {start: {line: 4586, column: 8}, end: {line: 4587, column: 8}} |  |
| text | Default: | {start: {line: 4591, column: 2}, end: {line: 4591, column: 10}} |  |
| text | Example: | {start: {line: 4599, column: 2}, end: {line: 4599, column: 10}} |  |
| text | Declared by: | {start: {line: 4605, column: 2}, end: {line: 4605, column: 14}} |  |
| text | Flake Parts Modules | {start: {line: 4, column: 3}, end: {line: 4, column: 22}} | {depth: 1, level: 1} |
| text | home.<name>.config | {start: {line: 5, column: 4}, end: {line: 5, column: 25}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 19, column: 1}, end: {line: 21, column: 4}} | {lang: nix} |
| code | {
  imports = [
    ./devices/my-laptop/configuration.nix
  ];
}
 | {start: {line: 27, column: 1}, end: {line: 34, column: 4}} | {lang: nix} |
| link | /parts/home.nix | {start: {line: 37, column: 4}, end: {line: 37, column: 83}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/parts/home.nix} |
| text | home.<name>.system | {start: {line: 41, column: 4}, end: {line: 41, column: 25}} | {depth: 2, level: 2} |
| link | /parts/home.nix | {start: {line: 53, column: 4}, end: {line: 53, column: 83}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/parts/home.nix} |
| text | nixos.devices | {start: {line: 57, column: 4}, end: {line: 57, column: 18}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 74, column: 1}, end: {line: 76, column: 4}} | {lang: nix} |
| code | {
  my-laptop.imports = [
    ./devices/my-laptop/configuration.nix
  ];
  my-server.imports = [
    ./devices/my-server/configuration.nix
  ];
}
 | {start: {line: 82, column: 1}, end: {line: 92, column: 4}} | {lang: nix} |
| link | /parts/nixos.nix | {start: {line: 95, column: 4}, end: {line: 95, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/parts/nixos.nix} |
| text | nixos.sharedModules | {start: {line: 99, column: 4}, end: {line: 99, column: 24}} | {depth: 2, level: 2} |
| code | [ ] | {start: {line: 115, column: 1}, end: {line: 117, column: 4}} | {lang: nix} |
| code | [
  ./home/home-manager.nix
  home-manager.nixosModules.home-manager
  sops-nix.nixosModules.sops
]
 | {start: {line: 123, column: 1}, end: {line: 130, column: 4}} | {lang: nix} |
| link | /parts/nixos.nix | {start: {line: 133, column: 4}, end: {line: 133, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/parts/nixos.nix} |
| text | NixOS Modules | {start: {line: 136, column: 3}, end: {line: 136, column: 16}} | {depth: 1, level: 1} |
| text | funkcia.install-dir | {start: {line: 137, column: 4}, end: {line: 137, column: 24}} | {depth: 2, level: 2} |
| code | toString (funkcia-utils.projectPath ./.) | {start: {line: 150, column: 1}, end: {line: 152, column: 4}} | {lang: nix} |
| link | /nixos/options.nix | {start: {line: 155, column: 4}, end: {line: 155, column: 89}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/options.nix} |
| text | funkcia.nix.lix.enable | {start: {line: 159, column: 4}, end: {line: 159, column: 29}} | {depth: 2, level: 2} |
| code | false | {start: {line: 174, column: 1}, end: {line: 176, column: 4}} | {lang: nix} |
| code | true | {start: {line: 182, column: 1}, end: {line: 184, column: 4}} | {lang: nix} |
| link | /nixos/nix.nix | {start: {line: 187, column: 4}, end: {line: 187, column: 81}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/nix.nix} |
| text | funkcia.os.DE.enable | {start: {line: 191, column: 4}, end: {line: 191, column: 27}} | {depth: 2, level: 2} |
| code | false | {start: {line: 206, column: 1}, end: {line: 208, column: 4}} | {lang: nix} |
| code | true | {start: {line: 214, column: 1}, end: {line: 216, column: 4}} | {lang: nix} |
| link | /nixos/DE/default.nix | {start: {line: 219, column: 4}, end: {line: 219, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/default.nix} |
| text | funkcia.os.DE.components.gnome.enable | {start: {line: 223, column: 4}, end: {line: 223, column: 46}} | {depth: 2, level: 2} |
| code | false | {start: {line: 238, column: 1}, end: {line: 240, column: 4}} | {lang: nix} |
| code | true | {start: {line: 246, column: 1}, end: {line: 248, column: 4}} | {lang: nix} |
| link | /nixos/DE/components/gnome.nix | {start: {line: 251, column: 4}, end: {line: 251, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/components/gnome.nix} |
| text | funkcia.os.DE.components.noctalia.enable | {start: {line: 255, column: 4}, end: {line: 255, column: 49}} | {depth: 2, level: 2} |
| code | false | {start: {line: 271, column: 1}, end: {line: 273, column: 4}} | {lang: nix} |
| code | true | {start: {line: 279, column: 1}, end: {line: 281, column: 4}} | {lang: nix} |
| link | /nixos/DE/components/noctalia.nix | {start: {line: 284, column: 4}, end: {line: 284, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/components/noctalia.nix} |
| text | funkcia.os.DE.compositor.hyprland.enable | {start: {line: 288, column: 4}, end: {line: 288, column: 49}} | {depth: 2, level: 2} |
| code | false | {start: {line: 304, column: 1}, end: {line: 306, column: 4}} | {lang: nix} |
| code | true | {start: {line: 312, column: 1}, end: {line: 314, column: 4}} | {lang: nix} |
| link | /nixos/DE/compositor/hyprland.nix | {start: {line: 317, column: 4}, end: {line: 317, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/compositor/hyprland.nix} |
| text | funkcia.os.DE.compositor.niri.enable | {start: {line: 321, column: 4}, end: {line: 321, column: 45}} | {depth: 2, level: 2} |
| code | false | {start: {line: 337, column: 1}, end: {line: 339, column: 4}} | {lang: nix} |
| code | true | {start: {line: 345, column: 1}, end: {line: 347, column: 4}} | {lang: nix} |
| link | /nixos/DE/compositor/niri.nix | {start: {line: 350, column: 4}, end: {line: 350, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/compositor/niri.nix} |
| text | funkcia.os.DE.compositor.umbriel.enable | {start: {line: 354, column: 4}, end: {line: 354, column: 48}} | {depth: 2, level: 2} |
| code | false | {start: {line: 370, column: 1}, end: {line: 372, column: 4}} | {lang: nix} |
| code | true | {start: {line: 378, column: 1}, end: {line: 380, column: 4}} | {lang: nix} |
| link | /nixos/DE/compositor/umbriel.nix | {start: {line: 383, column: 4}, end: {line: 383, column: 117}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/compositor/umbriel.nix} |
| text | funkcia.os.DE.displayManager.ly.enable | {start: {line: 387, column: 4}, end: {line: 387, column: 47}} | {depth: 2, level: 2} |
| code | false | {start: {line: 402, column: 1}, end: {line: 404, column: 4}} | {lang: nix} |
| code | true | {start: {line: 410, column: 1}, end: {line: 412, column: 4}} | {lang: nix} |
| link | /nixos/DE/displayManager/ly.nix | {start: {line: 415, column: 4}, end: {line: 415, column: 115}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/displayManager/ly.nix} |
| text | funkcia.os.DE.displayManager.noctalia-greeter.enable | {start: {line: 419, column: 4}, end: {line: 419, column: 61}} | {depth: 2, level: 2} |
| code | false | {start: {line: 434, column: 1}, end: {line: 436, column: 4}} | {lang: nix} |
| code | true | {start: {line: 442, column: 1}, end: {line: 444, column: 4}} | {lang: nix} |
| link | /nixos/DE/displayManager/noctalia-greeter.nix | {start: {line: 447, column: 4}, end: {line: 447, column: 143}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/displayManager/noctalia-greeter.nix} |
| text | funkcia.os.DE.displayManager.sddm.enable | {start: {line: 451, column: 4}, end: {line: 451, column: 49}} | {depth: 2, level: 2} |
| code | false | {start: {line: 466, column: 1}, end: {line: 468, column: 4}} | {lang: nix} |
| code | true | {start: {line: 474, column: 1}, end: {line: 476, column: 4}} | {lang: nix} |
| link | /nixos/DE/displayManager/sddm.nix | {start: {line: 479, column: 4}, end: {line: 479, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/displayManager/sddm.nix} |
| text | funkcia.os.DE.displayManager.sddm.theme.config | {start: {line: 483, column: 4}, end: {line: 483, column: 56}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 498, column: 1}, end: {line: 500, column: 4}} | {lang: nix} |
| code | {
  Background = "Backgrounds/your-custom-background.png";
  HeaderTextColor = "#d5c4a1";
} | {start: {line: 506, column: 1}, end: {line: 511, column: 4}} | {lang: nix} |
| link | /nixos/DE/displayManager/sddm.nix | {start: {line: 514, column: 4}, end: {line: 514, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/displayManager/sddm.nix} |
| text | funkcia.os.DE.displayManager.sddm.theme.name | {start: {line: 518, column: 4}, end: {line: 518, column: 54}} | {depth: 2, level: 2} |
| text | https://github\\.com/Keyitdev/sddm-astronaut-theme/tree/master/Themes | {start: {line: 522, column: 42}, end: {line: 522, column: 110}} | {url: https://github\\.com/Keyitdev/sddm-astronaut-theme/tree/master/Themes} |
| code | "hyprland_kath" | {start: {line: 533, column: 1}, end: {line: 535, column: 4}} | {lang: nix} |
| link | /nixos/DE/displayManager/sddm.nix | {start: {line: 538, column: 4}, end: {line: 538, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/displayManager/sddm.nix} |
| text | funkcia.os.DE.isWayland | {start: {line: 542, column: 4}, end: {line: 542, column: 30}} | {depth: 2, level: 2} |
| link | /nixos/DE/default.nix | {start: {line: 554, column: 4}, end: {line: 554, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/default.nix} |
| text | funkcia.os.DE.settings.extra-fonts.enable | {start: {line: 558, column: 4}, end: {line: 558, column: 50}} | {depth: 2, level: 2} |
| code | false | {start: {line: 573, column: 1}, end: {line: 575, column: 4}} | {lang: nix} |
| code | true | {start: {line: 581, column: 1}, end: {line: 583, column: 4}} | {lang: nix} |
| link | /nixos/DE/settings/extra-fonts.nix | {start: {line: 586, column: 4}, end: {line: 586, column: 121}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/settings/extra-fonts.nix} |
| text | funkcia.os.DE.settings.keyring.enable | {start: {line: 590, column: 4}, end: {line: 590, column: 46}} | {depth: 2, level: 2} |
| code | false | {start: {line: 605, column: 1}, end: {line: 607, column: 4}} | {lang: nix} |
| code | true | {start: {line: 613, column: 1}, end: {line: 615, column: 4}} | {lang: nix} |
| link | /nixos/DE/settings/keyring.nix | {start: {line: 618, column: 4}, end: {line: 618, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/settings/keyring.nix} |
| text | funkcia.os.DE.settings.keyring.provider | {start: {line: 622, column: 4}, end: {line: 622, column: 48}} | {depth: 2, level: 2} |
| code | {
  gnome-keyring = { };
} | {start: {line: 637, column: 1}, end: {line: 641, column: 4}} | {lang: nix} |
| code | {
  oo7 = {
    tpm2 = {
      enable = true;
    };
  };
} | {start: {line: 647, column: 1}, end: {line: 655, column: 4}} | {lang: nix} |
| link | /nixos/DE/settings/keyring.nix | {start: {line: 658, column: 4}, end: {line: 658, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/settings/keyring.nix} |
| text | funkcia.os.DE.settings.keyring.provider.gnome-keyring | {start: {line: 662, column: 4}, end: {line: 662, column: 63}} | {depth: 2, level: 2} |
| link | https://wiki\\.nixos\\.org/wiki/Secret_Service | {start: {line: 667, column: 27}, end: {line: 667, column: 71}} | {url: https://wiki\\.nixos\\.org/wiki/Secret_Service} |
| link | /nixos/DE/settings/keyring.nix | {start: {line: 675, column: 4}, end: {line: 675, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/settings/keyring.nix} |
| text | funkcia.os.DE.settings.keyring.provider.oo7 | {start: {line: 679, column: 4}, end: {line: 679, column: 53}} | {depth: 2, level: 2} |
| link | https://github\\.com/linux-credentials/oo7 | {start: {line: 684, column: 42}, end: {line: 684, column: 83}} | {url: https://github\\.com/linux-credentials/oo7} |
| link | /nixos/DE/settings/keyring.nix | {start: {line: 692, column: 4}, end: {line: 692, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/settings/keyring.nix} |
| text | funkcia.os.DE.settings.keyring.provider.oo7.tpm2.enable | {start: {line: 696, column: 4}, end: {line: 696, column: 67}} | {depth: 2, level: 2} |
| code | false | {start: {line: 711, column: 1}, end: {line: 713, column: 4}} | {lang: nix} |
| code | true | {start: {line: 719, column: 1}, end: {line: 721, column: 4}} | {lang: nix} |
| link | /nixos/DE/settings/keyring.nix | {start: {line: 724, column: 4}, end: {line: 724, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/DE/settings/keyring.nix} |
| text | funkcia.os.btrbk.home.enable | {start: {line: 728, column: 4}, end: {line: 728, column: 36}} | {depth: 2, level: 2} |
| code | false | {start: {line: 743, column: 1}, end: {line: 745, column: 4}} | {lang: nix} |
| code | true | {start: {line: 751, column: 1}, end: {line: 753, column: 4}} | {lang: nix} |
| link | /nixos/btrbk.nix | {start: {line: 756, column: 4}, end: {line: 756, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/btrbk.nix} |
| text | funkcia.os.configure-ip.enable | {start: {line: 760, column: 4}, end: {line: 760, column: 37}} | {depth: 2, level: 2} |
| code | false | {start: {line: 775, column: 1}, end: {line: 777, column: 4}} | {lang: nix} |
| code | true | {start: {line: 783, column: 1}, end: {line: 785, column: 4}} | {lang: nix} |
| link | /nixos/configure-ip.nix | {start: {line: 788, column: 4}, end: {line: 788, column: 99}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/configure-ip.nix} |
| text | funkcia.os.configure-ip.v4 | {start: {line: 792, column: 4}, end: {line: 792, column: 33}} | {depth: 2, level: 2} |
| link | /nixos/configure-ip.nix | {start: {line: 804, column: 4}, end: {line: 804, column: 99}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/configure-ip.nix} |
| text | funkcia.os.configure-ip.v4.<name>.addr | {start: {line: 808, column: 4}, end: {line: 808, column: 48}} | {depth: 2, level: 2} |
| strong | 明文 | {start: {line: 816, column: 4}, end: {line: 816, column: 14}} | {level: 0, ordered: false} |
| text | ：此时直接设置值，比如  | {start: {line: 816, column: 14}, end: {line: 816, column: 48}} | {level: 0, ordered: false} |
| code_inline | "123.45.67.89" | {start: {line: 816, column: 48}, end: {line: 816, column: 66}} | {level: 0, ordered: false} |
| strong | 密文 | {start: {line: 817, column: 4}, end: {line: 817, column: 14}} | {level: 0, ordered: false} |
| text | ：此时设置  | {start: {line: 817, column: 14}, end: {line: 817, column: 30}} | {level: 0, ordered: false} |
| code_inline | config.sops.placeholder.<key> | {start: {line: 817, column: 30}, end: {line: 817, column: 63}} | {level: 0, ordered: false} |
| text |  即可 | {start: {line: 817, column: 63}, end: {line: 817, column: 70}} | {level: 0, ordered: false} |
| code | config.sops.placeholder."network/ens3/ipv4" | {start: {line: 828, column: 1}, end: {line: 830, column: 4}} | {lang: nix} |
| link | /nixos/configure-ip.nix | {start: {line: 833, column: 4}, end: {line: 833, column: 99}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/configure-ip.nix} |
| text | funkcia.os.configure-ip.v4.<name>.gateway | {start: {line: 837, column: 4}, end: {line: 837, column: 51}} | {depth: 2, level: 2} |
| strong | 明文 | {start: {line: 845, column: 4}, end: {line: 845, column: 14}} | {level: 0, ordered: false} |
| text | ：此时直接设置值，比如  | {start: {line: 845, column: 14}, end: {line: 845, column: 48}} | {level: 0, ordered: false} |
| code_inline | "123.45.67.89" | {start: {line: 845, column: 48}, end: {line: 845, column: 66}} | {level: 0, ordered: false} |
| strong | 密文 | {start: {line: 846, column: 4}, end: {line: 846, column: 14}} | {level: 0, ordered: false} |
| text | ：此时设置  | {start: {line: 846, column: 14}, end: {line: 846, column: 30}} | {level: 0, ordered: false} |
| code_inline | config.sops.placeholder.<key> | {start: {line: 846, column: 30}, end: {line: 846, column: 63}} | {level: 0, ordered: false} |
| text |  即可 | {start: {line: 846, column: 63}, end: {line: 846, column: 70}} | {level: 0, ordered: false} |
| code | config.sops.placeholder."network/ens3/ipv4" | {start: {line: 857, column: 1}, end: {line: 859, column: 4}} | {lang: nix} |
| link | /nixos/configure-ip.nix | {start: {line: 862, column: 4}, end: {line: 862, column: 99}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/configure-ip.nix} |
| text | funkcia.os.configure-ip.v4.<name>.mask | {start: {line: 866, column: 4}, end: {line: 866, column: 48}} | {depth: 2, level: 2} |
| strong | 明文 | {start: {line: 874, column: 4}, end: {line: 874, column: 14}} | {level: 0, ordered: false} |
| text | ：此时直接设置值，比如  | {start: {line: 874, column: 14}, end: {line: 874, column: 48}} | {level: 0, ordered: false} |
| code_inline | "123.45.67.89" | {start: {line: 874, column: 48}, end: {line: 874, column: 66}} | {level: 0, ordered: false} |
| strong | 密文 | {start: {line: 875, column: 4}, end: {line: 875, column: 14}} | {level: 0, ordered: false} |
| text | ：此时设置  | {start: {line: 875, column: 14}, end: {line: 875, column: 30}} | {level: 0, ordered: false} |
| code_inline | config.sops.placeholder.<key> | {start: {line: 875, column: 30}, end: {line: 875, column: 63}} | {level: 0, ordered: false} |
| text |  即可 | {start: {line: 875, column: 63}, end: {line: 875, column: 70}} | {level: 0, ordered: false} |
| code | config.sops.placeholder."network/ens3/ipv4" | {start: {line: 886, column: 1}, end: {line: 888, column: 4}} | {lang: nix} |
| link | /nixos/configure-ip.nix | {start: {line: 891, column: 4}, end: {line: 891, column: 99}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/configure-ip.nix} |
| text | funkcia.os.domain.suffix | {start: {line: 895, column: 4}, end: {line: 895, column: 31}} | {depth: 2, level: 2} |
| link | /nixos/domains.nix | {start: {line: 907, column: 4}, end: {line: 907, column: 89}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/domains.nix} |
| text | funkcia.os.domains | {start: {line: 911, column: 4}, end: {line: 911, column: 24}} | {depth: 2, level: 2} |
| link | /nixos/domains.nix | {start: {line: 923, column: 4}, end: {line: 923, column: 89}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/domains.nix} |
| text | funkcia.os.domains.<name>.value | {start: {line: 927, column: 4}, end: {line: 927, column: 40}} | {depth: 2, level: 2} |
| link | /nixos/domains.nix | {start: {line: 944, column: 4}, end: {line: 944, column: 89}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/domains.nix} |
| text | funkcia.os.fingerprint.enable | {start: {line: 948, column: 4}, end: {line: 948, column: 36}} | {depth: 2, level: 2} |
| code | false | {start: {line: 963, column: 1}, end: {line: 965, column: 4}} | {lang: nix} |
| code | true | {start: {line: 971, column: 1}, end: {line: 973, column: 4}} | {lang: nix} |
| link | /nixos/fingerprint.nix | {start: {line: 976, column: 4}, end: {line: 976, column: 97}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/fingerprint.nix} |
| text | funkcia.os.fingerprint.todDriver | {start: {line: 980, column: 4}, end: {line: 980, column: 39}} | {depth: 2, level: 2} |
| text | pkgs.libfprint-2-tod1-elan; # Elan(04f3:0c4b) driver | {start: {line: 986, column: 4}, end: {line: 986, column: 58}} | {level: 0, ordered: false} |
| text | pkgs.libfprint-2-tod1-vfs0090; # (Marked as broken as of 2025/04/23!) driver for 2016 ThinkPads | {start: {line: 987, column: 4}, end: {line: 987, column: 101}} | {level: 0, ordered: false} |
| text | pkgs.libfprint-2-tod1-goodix-550a; # Goodix 550a driver (from Lenovo) | {start: {line: 988, column: 4}, end: {line: 988, column: 75}} | {level: 0, ordered: false} |
| text | https://wiki\\.nixos\\.org/wiki/Fingerprint_scanner | {start: {line: 990, column: 5}, end: {line: 990, column: 54}} | {url: https://wiki\\.nixos\\.org/wiki/Fingerprint_scanner} |
| code | null | {start: {line: 1001, column: 1}, end: {line: 1003, column: 4}} | {lang: nix} |
| link | /nixos/fingerprint.nix | {start: {line: 1006, column: 4}, end: {line: 1006, column: 97}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/fingerprint.nix} |
| text | funkcia.os.firewall.allow-cloudflare.enable | {start: {line: 1010, column: 4}, end: {line: 1010, column: 51}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1025, column: 1}, end: {line: 1027, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1033, column: 1}, end: {line: 1035, column: 4}} | {lang: nix} |
| link | /nixos/firewall/allow-cloudflare.nix | {start: {line: 1038, column: 4}, end: {line: 1038, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/firewall/allow-cloudflare.nix} |
| text | funkcia.os.firewall.allow-cloudflare.allowedTCPPorts | {start: {line: 1042, column: 4}, end: {line: 1042, column: 60}} | {depth: 2, level: 2} |
| code | [
  80
  443
] | {start: {line: 1057, column: 1}, end: {line: 1062, column: 4}} | {lang: nix} |
| link | /nixos/firewall/allow-cloudflare.nix | {start: {line: 1065, column: 4}, end: {line: 1065, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/firewall/allow-cloudflare.nix} |
| text | funkcia.os.flatpak.enable | {start: {line: 1069, column: 4}, end: {line: 1069, column: 32}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1084, column: 1}, end: {line: 1086, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1092, column: 1}, end: {line: 1094, column: 4}} | {lang: nix} |
| link | /nixos/flatpak.nix | {start: {line: 1097, column: 4}, end: {line: 1097, column: 89}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/flatpak.nix} |
| text | funkcia.os.incus.enable | {start: {line: 1101, column: 4}, end: {line: 1101, column: 30}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1116, column: 1}, end: {line: 1118, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1124, column: 1}, end: {line: 1126, column: 4}} | {lang: nix} |
| link | /nixos/incus.nix | {start: {line: 1129, column: 4}, end: {line: 1129, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/incus.nix} |
| text | funkcia.os.incus.mountNix | {start: {line: 1133, column: 4}, end: {line: 1133, column: 32}} | {depth: 2, level: 2} |
| code | true | {start: {line: 1148, column: 1}, end: {line: 1150, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1156, column: 1}, end: {line: 1158, column: 4}} | {lang: nix} |
| link | /nixos/incus.nix | {start: {line: 1161, column: 4}, end: {line: 1161, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/incus.nix} |
| text | funkcia.os.incus.network.ipv4.address | {start: {line: 1165, column: 4}, end: {line: 1165, column: 46}} | {depth: 2, level: 2} |
| code | "172.24.0.1/24" | {start: {line: 1180, column: 1}, end: {line: 1182, column: 4}} | {lang: nix} |
| link | /nixos/incus.nix | {start: {line: 1185, column: 4}, end: {line: 1185, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/incus.nix} |
| text | funkcia.os.incus.profiles | {start: {line: 1189, column: 4}, end: {line: 1189, column: 32}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 1204, column: 1}, end: {line: 1206, column: 4}} | {lang: nix} |
| link | /nixos/incus.nix | {start: {line: 1209, column: 4}, end: {line: 1209, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/incus.nix} |
| text | funkcia.os.incus.trustInterface | {start: {line: 1213, column: 4}, end: {line: 1213, column: 38}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1228, column: 1}, end: {line: 1230, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1236, column: 1}, end: {line: 1238, column: 4}} | {lang: nix} |
| link | /nixos/incus.nix | {start: {line: 1241, column: 4}, end: {line: 1241, column: 85}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/incus.nix} |
| text | funkcia.os.local-ca.enable | {start: {line: 1245, column: 4}, end: {line: 1245, column: 33}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1260, column: 1}, end: {line: 1262, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1268, column: 1}, end: {line: 1270, column: 4}} | {lang: nix} |
| link | /nixos/local-ca/default.nix | {start: {line: 1273, column: 4}, end: {line: 1273, column: 107}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/local-ca/default.nix} |
| text | funkcia.os.modern-cli-tools.enable | {start: {line: 1277, column: 4}, end: {line: 1277, column: 41}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1295, column: 1}, end: {line: 1297, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1303, column: 1}, end: {line: 1305, column: 4}} | {lang: nix} |
| link | /nixos/modern-cli-tools.nix | {start: {line: 1308, column: 4}, end: {line: 1308, column: 107}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/modern-cli-tools.nix} |
| text | funkcia.os.networking.enable | {start: {line: 1312, column: 4}, end: {line: 1312, column: 35}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1327, column: 1}, end: {line: 1329, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1335, column: 1}, end: {line: 1337, column: 4}} | {lang: nix} |
| link | /nixos/networking.nix | {start: {line: 1340, column: 4}, end: {line: 1340, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/networking.nix} |
| text | funkcia.os.networking.environment | {start: {line: 1344, column: 4}, end: {line: 1344, column: 40}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 1359, column: 1}, end: {line: 1361, column: 4}} | {lang: nix} |
| link | /nixos/networking.nix | {start: {line: 1364, column: 4}, end: {line: 1364, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/networking.nix} |
| text | funkcia.os.networking.noProxy | {start: {line: 1368, column: 4}, end: {line: 1368, column: 36}} | {depth: 2, level: 2} |
| code | [
  "127.0.0.1"
  "localhost"
  "internal.domain"
  ".internal"
  ".local"
] | {start: {line: 1384, column: 1}, end: {line: 1392, column: 4}} | {lang: nix} |
| code | [
  ".lan"
  "example.internal"
] | {start: {line: 1398, column: 1}, end: {line: 1403, column: 4}} | {lang: nix} |
| link | /nixos/networking.nix | {start: {line: 1406, column: 4}, end: {line: 1406, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/networking.nix} |
| text | funkcia.os.networking.proxy | {start: {line: 1410, column: 4}, end: {line: 1410, column: 34}} | {depth: 2, level: 2} |
| code | null | {start: {line: 1425, column: 1}, end: {line: 1427, column: 4}} | {lang: nix} |
| code | "http://127.0.0.1:3128" | {start: {line: 1433, column: 1}, end: {line: 1435, column: 4}} | {lang: nix} |
| link | /nixos/networking.nix | {start: {line: 1438, column: 4}, end: {line: 1438, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/networking.nix} |
| text | funkcia.os.nsn.enable | {start: {line: 1442, column: 4}, end: {line: 1442, column: 28}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1458, column: 1}, end: {line: 1460, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1466, column: 1}, end: {line: 1468, column: 4}} | {lang: nix} |
| link | /nixos/nsn.nix | {start: {line: 1471, column: 4}, end: {line: 1471, column: 81}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/nsn.nix} |
| text | funkcia.os.nsn.containers | {start: {line: 1475, column: 4}, end: {line: 1475, column: 32}} | {depth: 2, level: 2} |
| code_inline | config.containers | {start: {line: 1482, column: 32}, end: {line: 1482, column: 53}} | {url: https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/virtualisation/nixos-containers.nix} |
| code | { } | {start: {line: 1493, column: 1}, end: {line: 1495, column: 4}} | {lang: nix} |
| link | /nixos/nsn.nix | {start: {line: 1498, column: 4}, end: {line: 1498, column: 81}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/nsn.nix} |
| text | funkcia.os.nsn.externalInterface | {start: {line: 1502, column: 4}, end: {line: 1502, column: 39}} | {depth: 2, level: 2} |
| link | /nixos/nsn.nix | {start: {line: 1514, column: 4}, end: {line: 1514, column: 81}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/nsn.nix} |
| text | funkcia.os.presets.cn.enable | {start: {line: 1518, column: 4}, end: {line: 1518, column: 36}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1533, column: 1}, end: {line: 1535, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1541, column: 1}, end: {line: 1543, column: 4}} | {lang: nix} |
| link | /nixos/presets/cn.nix | {start: {line: 1546, column: 4}, end: {line: 1546, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/cn.nix} |
| text | funkcia.os.presets.container.enable | {start: {line: 1550, column: 4}, end: {line: 1550, column: 43}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1565, column: 1}, end: {line: 1567, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1573, column: 1}, end: {line: 1575, column: 4}} | {lang: nix} |
| link | /nixos/presets/container.nix | {start: {line: 1578, column: 4}, end: {line: 1578, column: 109}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/container.nix} |
| text | funkcia.os.presets.defaults.enable | {start: {line: 1582, column: 4}, end: {line: 1582, column: 42}} | {depth: 2, level: 2} |
| code | true | {start: {line: 1597, column: 1}, end: {line: 1599, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1605, column: 1}, end: {line: 1607, column: 4}} | {lang: nix} |
| link | /nixos/presets/defaults.nix | {start: {line: 1610, column: 4}, end: {line: 1610, column: 107}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/defaults.nix} |
| text | funkcia.os.presets.defaults.locale.enable | {start: {line: 1614, column: 4}, end: {line: 1614, column: 50}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1629, column: 1}, end: {line: 1631, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1637, column: 1}, end: {line: 1639, column: 4}} | {lang: nix} |
| link | /nixos/presets/defaults/locale.nix | {start: {line: 1642, column: 4}, end: {line: 1642, column: 121}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/defaults/locale.nix} |
| text | funkcia.os.presets.defaults.security.enable | {start: {line: 1646, column: 4}, end: {line: 1646, column: 52}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1661, column: 1}, end: {line: 1663, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1669, column: 1}, end: {line: 1671, column: 4}} | {lang: nix} |
| link | /nixos/presets/defaults/security.nix | {start: {line: 1674, column: 4}, end: {line: 1674, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/defaults/security.nix} |
| text | funkcia.os.presets.defaults.security.replacePkexec | {start: {line: 1678, column: 4}, end: {line: 1678, column: 59}} | {depth: 2, level: 2} |
| code | true | {start: {line: 1693, column: 1}, end: {line: 1695, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1701, column: 1}, end: {line: 1703, column: 4}} | {lang: nix} |
| link | /nixos/presets/defaults/security.nix | {start: {line: 1706, column: 4}, end: {line: 1706, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/defaults/security.nix} |
| text | funkcia.os.presets.defaults.terminfo.enable | {start: {line: 1710, column: 4}, end: {line: 1710, column: 52}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1729, column: 1}, end: {line: 1731, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1737, column: 1}, end: {line: 1739, column: 4}} | {lang: nix} |
| link | /nixos/presets/defaults/terminfo.nix | {start: {line: 1742, column: 4}, end: {line: 1742, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/defaults/terminfo.nix} |
| text | funkcia.os.presets.defaults.terminfo.allTerminfo | {start: {line: 1746, column: 4}, end: {line: 1746, column: 57}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1761, column: 1}, end: {line: 1763, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1769, column: 1}, end: {line: 1771, column: 4}} | {lang: nix} |
| link | /nixos/presets/defaults/terminfo.nix | {start: {line: 1774, column: 4}, end: {line: 1774, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/defaults/terminfo.nix} |
| text | funkcia.os.presets.host.enable | {start: {line: 1778, column: 4}, end: {line: 1778, column: 38}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1793, column: 1}, end: {line: 1795, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1801, column: 1}, end: {line: 1803, column: 4}} | {lang: nix} |
| link | /nixos/presets/host.nix | {start: {line: 1806, column: 4}, end: {line: 1806, column: 99}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/host.nix} |
| text | funkcia.os.presets.host.btrfs-tools.enable | {start: {line: 1810, column: 4}, end: {line: 1810, column: 51}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1825, column: 1}, end: {line: 1827, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1833, column: 1}, end: {line: 1835, column: 4}} | {lang: nix} |
| link | /nixos/presets/host/btrfs-tools.nix | {start: {line: 1838, column: 4}, end: {line: 1838, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/host/btrfs-tools.nix} |
| text | funkcia.os.presets.host.collect-user.enable | {start: {line: 1842, column: 4}, end: {line: 1842, column: 52}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1857, column: 1}, end: {line: 1859, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1865, column: 1}, end: {line: 1867, column: 4}} | {lang: nix} |
| link | /nixos/presets/host/collect-user.nix | {start: {line: 1870, column: 4}, end: {line: 1870, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/host/collect-user.nix} |
| text | funkcia.os.presets.host.programs.enable | {start: {line: 1874, column: 4}, end: {line: 1874, column: 48}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1889, column: 1}, end: {line: 1891, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1897, column: 1}, end: {line: 1899, column: 4}} | {lang: nix} |
| link | /nixos/presets/host/programs.nix | {start: {line: 1902, column: 4}, end: {line: 1902, column: 117}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/host/programs.nix} |
| text | funkcia.os.presets.host.root.enable | {start: {line: 1906, column: 4}, end: {line: 1906, column: 44}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1921, column: 1}, end: {line: 1923, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1929, column: 1}, end: {line: 1931, column: 4}} | {lang: nix} |
| link | /nixos/presets/host/root.nix | {start: {line: 1934, column: 4}, end: {line: 1934, column: 109}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/host/root.nix} |
| text | funkcia.os.presets.host.services.enable | {start: {line: 1938, column: 4}, end: {line: 1938, column: 48}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1953, column: 1}, end: {line: 1955, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1961, column: 1}, end: {line: 1963, column: 4}} | {lang: nix} |
| link | /nixos/presets/host/services.nix | {start: {line: 1966, column: 4}, end: {line: 1966, column: 117}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/host/services.nix} |
| text | funkcia.os.presets.host.shell.enable | {start: {line: 1970, column: 4}, end: {line: 1970, column: 45}} | {depth: 2, level: 2} |
| code | false | {start: {line: 1985, column: 1}, end: {line: 1987, column: 4}} | {lang: nix} |
| code | true | {start: {line: 1993, column: 1}, end: {line: 1995, column: 4}} | {lang: nix} |
| link | /nixos/presets/host/shell.nix | {start: {line: 1998, column: 4}, end: {line: 1998, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/host/shell.nix} |
| text | funkcia.os.presets.laptop.enable | {start: {line: 2002, column: 4}, end: {line: 2002, column: 40}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2017, column: 1}, end: {line: 2019, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2025, column: 1}, end: {line: 2027, column: 4}} | {lang: nix} |
| link | /nixos/presets/laptop.nix | {start: {line: 2030, column: 4}, end: {line: 2030, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/laptop.nix} |
| text | funkcia.os.presets.laptop.using | {start: {line: 2034, column: 4}, end: {line: 2034, column: 39}} | {depth: 2, level: 2} |
| code | "power-profiles-daemon" | {start: {line: 2049, column: 1}, end: {line: 2051, column: 4}} | {lang: nix} |
| link | /nixos/presets/laptop.nix | {start: {line: 2054, column: 4}, end: {line: 2054, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/laptop.nix} |
| text | funkcia.os.presets.pc.enable | {start: {line: 2058, column: 4}, end: {line: 2058, column: 36}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2073, column: 1}, end: {line: 2075, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2081, column: 1}, end: {line: 2083, column: 4}} | {lang: nix} |
| link | /nixos/presets/pc.nix | {start: {line: 2086, column: 4}, end: {line: 2086, column: 95}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/pc.nix} |
| text | funkcia.os.presets.server.enable | {start: {line: 2090, column: 4}, end: {line: 2090, column: 40}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2105, column: 1}, end: {line: 2107, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2113, column: 1}, end: {line: 2115, column: 4}} | {lang: nix} |
| link | /nixos/presets/server.nix | {start: {line: 2118, column: 4}, end: {line: 2118, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/presets/server.nix} |
| text | funkcia.os.secure-boot.enable | {start: {line: 2122, column: 4}, end: {line: 2122, column: 36}} | {depth: 2, level: 2} |
| text | https://nix-community\\.github\\.io/lanzaboote/getting-started/prepare-your-system\\.html | {start: {line: 2128, column: 17}, end: {line: 2128, column: 103}} | {url: https://nix-community\\.github\\.io/lanzaboote/getting-started/prepare-your-system\\.html} |
| code | false | {start: {line: 2178, column: 1}, end: {line: 2180, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2186, column: 1}, end: {line: 2188, column: 4}} | {lang: nix} |
| link | /nixos/secure-boot.nix | {start: {line: 2191, column: 4}, end: {line: 2191, column: 97}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/secure-boot.nix} |
| text | funkcia.os.sops-support.enable | {start: {line: 2195, column: 4}, end: {line: 2195, column: 37}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2210, column: 1}, end: {line: 2212, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2218, column: 1}, end: {line: 2220, column: 4}} | {lang: nix} |
| link | /nixos/sops.nix | {start: {line: 2223, column: 4}, end: {line: 2223, column: 83}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/sops.nix} |
| text | funkcia.os.system.enableRecommand | {start: {line: 2227, column: 4}, end: {line: 2227, column: 40}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2242, column: 1}, end: {line: 2244, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2250, column: 1}, end: {line: 2252, column: 4}} | {lang: nix} |
| link | /nixos/system.nix | {start: {line: 2255, column: 4}, end: {line: 2255, column: 87}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/system.nix} |
| text | funkcia.os.system.bbr.enable | {start: {line: 2259, column: 4}, end: {line: 2259, column: 36}} | {depth: 2, level: 2} |
| code | true | {start: {line: 2276, column: 1}, end: {line: 2278, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2284, column: 1}, end: {line: 2286, column: 4}} | {lang: nix} |
| link | /nixos/system.nix | {start: {line: 2289, column: 4}, end: {line: 2289, column: 87}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/system.nix} |
| text | funkcia.os.tpm.enable | {start: {line: 2293, column: 4}, end: {line: 2293, column: 28}} | {depth: 2, level: 2} |
| text | https://nixos\\.wiki/wiki/TPM | {start: {line: 2298, column: 5}, end: {line: 2298, column: 33}} | {url: https://nixos\\.wiki/wiki/TPM} |
| code | false | {start: {line: 2310, column: 1}, end: {line: 2312, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2318, column: 1}, end: {line: 2320, column: 4}} | {lang: nix} |
| link | /nixos/tpm.nix | {start: {line: 2323, column: 4}, end: {line: 2323, column: 81}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/tpm.nix} |
| text | funkcia.os.tpm.tpm-fido.enable | {start: {line: 2327, column: 4}, end: {line: 2327, column: 38}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2342, column: 1}, end: {line: 2344, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2350, column: 1}, end: {line: 2352, column: 4}} | {lang: nix} |
| link | /nixos/tpm.nix | {start: {line: 2355, column: 4}, end: {line: 2355, column: 81}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/tpm.nix} |
| text | funkcia.os.user | {start: {line: 2359, column: 4}, end: {line: 2359, column: 21}} | {depth: 2, level: 2} |
| link | /nixos/user.nix | {start: {line: 2371, column: 4}, end: {line: 2371, column: 83}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/user.nix} |
| text | funkcia.os.user.<name>.is-admin | {start: {line: 2375, column: 4}, end: {line: 2375, column: 40}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2390, column: 1}, end: {line: 2392, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2398, column: 1}, end: {line: 2400, column: 4}} | {lang: nix} |
| link | /nixos/user.nix | {start: {line: 2403, column: 4}, end: {line: 2403, column: 83}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/user.nix} |
| text | funkcia.os.user.<name>.ssh-login.enable | {start: {line: 2407, column: 4}, end: {line: 2407, column: 49}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2422, column: 1}, end: {line: 2424, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2430, column: 1}, end: {line: 2432, column: 4}} | {lang: nix} |
| link | /nixos/user.nix | {start: {line: 2435, column: 4}, end: {line: 2435, column: 83}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/user.nix} |
| text | funkcia.os.winslow-cloud.enable | {start: {line: 2439, column: 4}, end: {line: 2439, column: 38}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2454, column: 1}, end: {line: 2456, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2462, column: 1}, end: {line: 2464, column: 4}} | {lang: nix} |
| link | /nixos/winslow-cloud.nix | {start: {line: 2467, column: 4}, end: {line: 2467, column: 101}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/winslow-cloud.nix} |
| text | funkcia.os.winslow-cloud.krb5.enable | {start: {line: 2471, column: 4}, end: {line: 2471, column: 44}} | {depth: 2, level: 2} |
| code | true | {start: {line: 2486, column: 1}, end: {line: 2488, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2494, column: 1}, end: {line: 2496, column: 4}} | {lang: nix} |
| link | /nixos/winslow-cloud.nix | {start: {line: 2499, column: 4}, end: {line: 2499, column: 101}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/winslow-cloud.nix} |
| text | funkcia.os.winslow-cloud.krb5.ccacheName | {start: {line: 2503, column: 4}, end: {line: 2503, column: 48}} | {depth: 2, level: 2} |
| code | "FILE:/run/user/%{uid}/krb5cc" | {start: {line: 2524, column: 1}, end: {line: 2526, column: 4}} | {lang: nix} |
| link | /nixos/winslow-cloud.nix | {start: {line: 2529, column: 4}, end: {line: 2529, column: 101}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/nixos/winslow-cloud.nix} |
| text | Home Manager Modules | {start: {line: 2532, column: 3}, end: {line: 2532, column: 23}} | {depth: 1, level: 1} |
| text | funkcia.hm.agents.enable | {start: {line: 2533, column: 4}, end: {line: 2533, column: 31}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2546, column: 1}, end: {line: 2548, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2554, column: 1}, end: {line: 2556, column: 4}} | {lang: nix} |
| link | /home/modules/agents.nix | {start: {line: 2559, column: 4}, end: {line: 2559, column: 101}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/agents.nix} |
| text | funkcia.hm.agents.md.path | {start: {line: 2563, column: 4}, end: {line: 2563, column: 33}} | {depth: 2, level: 2} |
| code | [ ] | {start: {line: 2578, column: 1}, end: {line: 2580, column: 4}} | {lang: nix} |
| link | /home/modules/agents.nix | {start: {line: 2583, column: 4}, end: {line: 2583, column: 101}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/agents.nix} |
| text | funkcia.hm.agents.md.text | {start: {line: 2587, column: 4}, end: {line: 2587, column: 33}} | {depth: 2, level: 2} |
| code | "" | {start: {line: 2602, column: 1}, end: {line: 2604, column: 4}} | {lang: nix} |
| link | /home/modules/agents.nix | {start: {line: 2607, column: 4}, end: {line: 2607, column: 101}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/agents.nix} |
| text | funkcia.hm.avatar | {start: {line: 2611, column: 4}, end: {line: 2611, column: 23}} | {depth: 2, level: 2} |
| code | null | {start: {line: 2626, column: 1}, end: {line: 2628, column: 4}} | {lang: nix} |
| link | /home/modules/avatar.nix | {start: {line: 2631, column: 4}, end: {line: 2631, column: 101}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/avatar.nix} |
| text | funkcia.hm.flatpak.enable | {start: {line: 2635, column: 4}, end: {line: 2635, column: 32}} | {depth: 2, level: 2} |
| code | osConfig.funkcia.os.flatpak.enable or false | {start: {line: 2651, column: 1}, end: {line: 2653, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2659, column: 1}, end: {line: 2661, column: 4}} | {lang: nix} |
| link | /home/modules/flatpak.nix | {start: {line: 2664, column: 4}, end: {line: 2664, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/flatpak.nix} |
| text | funkcia.hm.flatpak.mountFontConfig | {start: {line: 2668, column: 4}, end: {line: 2668, column: 41}} | {depth: 2, level: 2} |
| code | true | {start: {line: 2685, column: 1}, end: {line: 2687, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2693, column: 1}, end: {line: 2695, column: 4}} | {lang: nix} |
| link | /home/modules/flatpak.nix | {start: {line: 2698, column: 4}, end: {line: 2698, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/flatpak.nix} |
| text | funkcia.hm.flatpak.mountNixStore | {start: {line: 2702, column: 4}, end: {line: 2702, column: 39}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2724, column: 1}, end: {line: 2726, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2732, column: 1}, end: {line: 2734, column: 4}} | {lang: nix} |
| link | /home/modules/flatpak.nix | {start: {line: 2737, column: 4}, end: {line: 2737, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/flatpak.nix} |
| text | funkcia.hm.flatpak.overrides | {start: {line: 2741, column: 4}, end: {line: 2741, column: 35}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 2758, column: 1}, end: {line: 2760, column: 4}} | {lang: nix} |
| code | {
  "com.tencent.WeChat" = {
    Environment = {
      LANG = "zh_CN.UTF-8";
      LC_CTYPE = "zh_CN.UTF-8";
    };
  };
} | {start: {line: 2766, column: 1}, end: {line: 2775, column: 4}} | {lang: nix} |
| link | /home/modules/flatpak.nix | {start: {line: 2778, column: 4}, end: {line: 2778, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/flatpak.nix} |
| text | funkcia.hm.gui.enable | {start: {line: 2782, column: 4}, end: {line: 2782, column: 28}} | {depth: 2, level: 2} |
| code | osConfig.funkcia.os.DE.enable or false | {start: {line: 2797, column: 1}, end: {line: 2799, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2805, column: 1}, end: {line: 2807, column: 4}} | {lang: nix} |
| link | /home/modules/gui/gui.nix | {start: {line: 2810, column: 4}, end: {line: 2810, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/gui.nix} |
| text | funkcia.hm.gui.components.gnome.enable | {start: {line: 2814, column: 4}, end: {line: 2814, column: 47}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2829, column: 1}, end: {line: 2831, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2837, column: 1}, end: {line: 2839, column: 4}} | {lang: nix} |
| link | /home/modules/gui/components/gnome.nix | {start: {line: 2842, column: 4}, end: {line: 2842, column: 129}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/components/gnome.nix} |
| text | funkcia.hm.gui.components.kde.enable | {start: {line: 2846, column: 4}, end: {line: 2846, column: 45}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2861, column: 1}, end: {line: 2863, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2869, column: 1}, end: {line: 2871, column: 4}} | {lang: nix} |
| link | /home/modules/gui/components/kde.nix | {start: {line: 2874, column: 4}, end: {line: 2874, column: 125}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/components/kde.nix} |
| text | funkcia.hm.gui.libreoffice.enable | {start: {line: 2878, column: 4}, end: {line: 2878, column: 41}} | {depth: 2, level: 2} |
| code | false | {start: {line: 2893, column: 1}, end: {line: 2895, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2901, column: 1}, end: {line: 2903, column: 4}} | {lang: nix} |
| link | /home/modules/gui/libreoffice.nix | {start: {line: 2906, column: 4}, end: {line: 2906, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/libreoffice.nix} |
| text | funkcia.hm.gui.noctalia.enable | {start: {line: 2910, column: 4}, end: {line: 2910, column: 38}} | {depth: 2, level: 2} |
| code | osConfig.programs.noctalia.enable or false | {start: {line: 2925, column: 1}, end: {line: 2927, column: 4}} | {lang: nix} |
| code | true | {start: {line: 2933, column: 1}, end: {line: 2935, column: 4}} | {lang: nix} |
| link | /home/modules/gui/noctalia.nix | {start: {line: 2938, column: 4}, end: {line: 2938, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix} |
| text | funkcia.hm.gui.noctalia.bars | {start: {line: 2942, column: 4}, end: {line: 2942, column: 36}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 2957, column: 1}, end: {line: 2959, column: 4}} | {lang: nix} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 2962, column: 4}, end: {line: 2962, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.bars.<name>.center | {start: {line: 2966, column: 4}, end: {line: 2966, column: 53}} | {depth: 2, level: 2} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 2978, column: 4}, end: {line: 2978, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.bars.<name>.center.*.type | {start: {line: 2982, column: 4}, end: {line: 2982, column: 63}} | {depth: 2, level: 2} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 2994, column: 4}, end: {line: 2994, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.bars.<name>.end | {start: {line: 2998, column: 4}, end: {line: 2998, column: 50}} | {depth: 2, level: 2} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 3010, column: 4}, end: {line: 3010, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.bars.<name>.end.*.type | {start: {line: 3014, column: 4}, end: {line: 3014, column: 60}} | {depth: 2, level: 2} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 3026, column: 4}, end: {line: 3026, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.bars.<name>.settings | {start: {line: 3030, column: 4}, end: {line: 3030, column: 55}} | {depth: 2, level: 2} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 3042, column: 4}, end: {line: 3042, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.bars.<name>.start | {start: {line: 3046, column: 4}, end: {line: 3046, column: 52}} | {depth: 2, level: 2} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 3058, column: 4}, end: {line: 3058, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.bars.<name>.start.*.type | {start: {line: 3062, column: 4}, end: {line: 3062, column: 62}} | {depth: 2, level: 2} |
| link | /home/modules/gui/noctalia/bars.nix | {start: {line: 3074, column: 4}, end: {line: 3074, column: 123}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia/bars.nix} |
| text | funkcia.hm.gui.noctalia.settings | {start: {line: 3078, column: 4}, end: {line: 3078, column: 40}} | {depth: 2, level: 2} |
| text | https://docs\\.noctalia\\.dev/noctalia/configuration/ | {start: {line: 3091, column: 5}, end: {line: 3091, column: 56}} | {url: https://docs\\.noctalia\\.dev/noctalia/configuration/} |
| code | { } | {start: {line: 3102, column: 1}, end: {line: 3104, column: 4}} | {lang: nix} |
| code | {
  bar = {
    default = {
      position = "top";
    };
  };
  theme = {
    mode = "dark";
  };
} | {start: {line: 3110, column: 1}, end: {line: 3121, column: 4}} | {lang: nix} |
| link | /home/modules/gui/noctalia.nix | {start: {line: 3124, column: 4}, end: {line: 3124, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix} |
| text | funkcia.hm.gui.v2rayn.enable | {start: {line: 3128, column: 4}, end: {line: 3128, column: 36}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3143, column: 1}, end: {line: 3145, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3151, column: 1}, end: {line: 3153, column: 4}} | {lang: nix} |
| link | /home/modules/gui/v2rayn.nix | {start: {line: 3156, column: 4}, end: {line: 3156, column: 109}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/v2rayn.nix} |
| text | funkcia.hm.gui.vicinae.enable | {start: {line: 3160, column: 4}, end: {line: 3160, column: 37}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3175, column: 1}, end: {line: 3177, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3183, column: 1}, end: {line: 3185, column: 4}} | {lang: nix} |
| link | /home/modules/gui/vicinae.nix | {start: {line: 3188, column: 4}, end: {line: 3188, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/vicinae.nix} |
| text | funkcia.hm.gui.vicinae.settings | {start: {line: 3192, column: 4}, end: {line: 3192, column: 39}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 3207, column: 1}, end: {line: 3209, column: 4}} | {lang: nix} |
| link | /home/modules/gui/vicinae.nix | {start: {line: 3212, column: 4}, end: {line: 3212, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/vicinae.nix} |
| text | funkcia.hm.gui.vicinae.systemd.enable | {start: {line: 3216, column: 4}, end: {line: 3216, column: 46}} | {depth: 2, level: 2} |
| code | true | {start: {line: 3231, column: 1}, end: {line: 3233, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3239, column: 1}, end: {line: 3241, column: 4}} | {lang: nix} |
| link | /home/modules/gui/vicinae.nix | {start: {line: 3244, column: 4}, end: {line: 3244, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/vicinae.nix} |
| text | funkcia.hm.gui.zen-browser.enable | {start: {line: 3248, column: 4}, end: {line: 3248, column: 41}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3263, column: 1}, end: {line: 3265, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3271, column: 1}, end: {line: 3273, column: 4}} | {lang: nix} |
| link | /home/modules/gui/zen-browser.nix | {start: {line: 3276, column: 4}, end: {line: 3276, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/zen-browser.nix} |
| text | funkcia.hm.gui.zen-browser.isDefaultBrowser | {start: {line: 3280, column: 4}, end: {line: 3280, column: 51}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3295, column: 1}, end: {line: 3297, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3303, column: 1}, end: {line: 3305, column: 4}} | {lang: nix} |
| link | /home/modules/gui/zen-browser.nix | {start: {line: 3308, column: 4}, end: {line: 3308, column: 119}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/zen-browser.nix} |
| text | funkcia.hm.language-sdk.cpp.enable | {start: {line: 3312, column: 4}, end: {line: 3312, column: 42}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3327, column: 1}, end: {line: 3329, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3335, column: 1}, end: {line: 3337, column: 4}} | {lang: nix} |
| link | /home/modules/language-sdk/cpp.nix | {start: {line: 3340, column: 4}, end: {line: 3340, column: 121}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/cpp.nix} |
| text | funkcia.hm.language-sdk.javascript.enable | {start: {line: 3344, column: 4}, end: {line: 3344, column: 49}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3359, column: 1}, end: {line: 3361, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3367, column: 1}, end: {line: 3369, column: 4}} | {lang: nix} |
| link | /home/modules/language-sdk/javascript.nix | {start: {line: 3372, column: 4}, end: {line: 3372, column: 135}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/javascript.nix} |
| text | funkcia.hm.language-sdk.javascript.bun.enable | {start: {line: 3376, column: 4}, end: {line: 3376, column: 54}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3391, column: 1}, end: {line: 3393, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3399, column: 1}, end: {line: 3401, column: 4}} | {lang: nix} |
| link | /home/modules/language-sdk/javascript.nix | {start: {line: 3404, column: 4}, end: {line: 3404, column: 135}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/javascript.nix} |
| text | funkcia.hm.language-sdk.javascript.nodejs.enable | {start: {line: 3408, column: 4}, end: {line: 3408, column: 57}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3423, column: 1}, end: {line: 3425, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3431, column: 1}, end: {line: 3433, column: 4}} | {lang: nix} |
| link | /home/modules/language-sdk/javascript.nix | {start: {line: 3436, column: 4}, end: {line: 3436, column: 135}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/javascript.nix} |
| text | funkcia.hm.language-sdk.nix.enable | {start: {line: 3440, column: 4}, end: {line: 3440, column: 42}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3455, column: 1}, end: {line: 3457, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3463, column: 1}, end: {line: 3465, column: 4}} | {lang: nix} |
| link | /home/modules/language-sdk/nix.nix | {start: {line: 3468, column: 4}, end: {line: 3468, column: 121}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/nix.nix} |
| text | funkcia.hm.language-sdk.python.enable | {start: {line: 3472, column: 4}, end: {line: 3472, column: 45}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3487, column: 1}, end: {line: 3489, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3495, column: 1}, end: {line: 3497, column: 4}} | {lang: nix} |
| link | /home/modules/language-sdk/python.nix | {start: {line: 3500, column: 4}, end: {line: 3500, column: 127}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/python.nix} |
| text | funkcia.hm.merge-files | {start: {line: 3504, column: 4}, end: {line: 3504, column: 28}} | {depth: 2, level: 2} |
| code | { } | {start: {line: 3519, column: 1}, end: {line: 3521, column: 4}} | {lang: nix} |
| link | /home/modules/merge-files.nix | {start: {line: 3524, column: 4}, end: {line: 3524, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/merge-files.nix} |
| text | funkcia.hm.modern-cli-tools.enable | {start: {line: 3528, column: 4}, end: {line: 3528, column: 41}} | {depth: 2, level: 2} |
| text | zoxide 替换 cd | {start: {line: 3534, column: 4}, end: {line: 3534, column: 20}} | {level: 0, ordered: false} |
| text | bat 替换 cat | {start: {line: 3535, column: 4}, end: {line: 3535, column: 18}} | {level: 0, ordered: false} |
| text | eza 替换 ls | {start: {line: 3536, column: 4}, end: {line: 3536, column: 17}} | {level: 0, ordered: false} |
| text | fzf 作为 fuzzy finder | {start: {line: 3537, column: 4}, end: {line: 3537, column: 27}} | {level: 0, ordered: false} |
| text | fd 替换 find | {start: {line: 3538, column: 4}, end: {line: 3538, column: 18}} | {level: 0, ordered: false} |
| text | rg 替换 grep | {start: {line: 3539, column: 4}, end: {line: 3539, column: 18}} | {level: 0, ordered: false} |
| text | fish 作为 interactive shell
. | {start: {line: 3540, column: 4}, end: {line: 3541, column: 6}} | {level: 0, ordered: false} |
| code | false | {start: {line: 3552, column: 1}, end: {line: 3554, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3560, column: 1}, end: {line: 3562, column: 4}} | {lang: nix} |
| link | /home/modules/modern-cli-tools.nix | {start: {line: 3565, column: 4}, end: {line: 3565, column: 121}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/modern-cli-tools.nix} |
| text | funkcia.hm.programs.dsh.enable | {start: {line: 3569, column: 4}, end: {line: 3569, column: 38}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3584, column: 1}, end: {line: 3586, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3592, column: 1}, end: {line: 3594, column: 4}} | {lang: nix} |
| link | /home/modules/programs/dsh.nix | {start: {line: 3597, column: 4}, end: {line: 3597, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/dsh.nix} |
| text | funkcia.hm.programs.dsh.environmentFiles | {start: {line: 3601, column: 4}, end: {line: 3601, column: 48}} | {depth: 2, level: 2} |
| code | [ ] | {start: {line: 3617, column: 1}, end: {line: 3619, column: 4}} | {lang: nix} |
| code | [ config.sops.templates."dsh-env".path ]
 | {start: {line: 3625, column: 1}, end: {line: 3628, column: 4}} | {lang: nix} |
| link | /home/modules/programs/dsh.nix | {start: {line: 3631, column: 4}, end: {line: 3631, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/dsh.nix} |
| text | funkcia.hm.programs.dsh.extraArgs | {start: {line: 3635, column: 4}, end: {line: 3635, column: 41}} | {depth: 2, level: 2} |
| code | [ ] | {start: {line: 3650, column: 1}, end: {line: 3652, column: 4}} | {lang: nix} |
| code | [ "--port" "8080" ]
 | {start: {line: 3658, column: 1}, end: {line: 3661, column: 4}} | {lang: nix} |
| link | /home/modules/programs/dsh.nix | {start: {line: 3664, column: 4}, end: {line: 3664, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/dsh.nix} |
| text | funkcia.hm.programs.dsh.systemd.enable | {start: {line: 3668, column: 4}, end: {line: 3668, column: 47}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3683, column: 1}, end: {line: 3685, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3691, column: 1}, end: {line: 3693, column: 4}} | {lang: nix} |
| link | /home/modules/programs/dsh.nix | {start: {line: 3696, column: 4}, end: {line: 3696, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/dsh.nix} |
| text | funkcia.hm.programs.pi.enable | {start: {line: 3700, column: 4}, end: {line: 3700, column: 37}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3715, column: 1}, end: {line: 3717, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3723, column: 1}, end: {line: 3725, column: 4}} | {lang: nix} |
| link | /home/modules/programs/pi.nix | {start: {line: 3728, column: 4}, end: {line: 3728, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix} |
| text | funkcia.hm.programs.pi.auth | {start: {line: 3732, column: 4}, end: {line: 3732, column: 35}} | {depth: 2, level: 2} |
| link | /home/modules/programs/pi.nix | {start: {line: 3744, column: 4}, end: {line: 3744, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix} |
| text | funkcia.hm.programs.pi.auth.<name>.key-path | {start: {line: 3748, column: 4}, end: {line: 3748, column: 54}} | {depth: 2, level: 2} |
| link | /home/modules/programs/pi.nix | {start: {line: 3760, column: 4}, end: {line: 3760, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix} |
| text | funkcia.hm.programs.pi.auth.<name>.type | {start: {line: 3764, column: 4}, end: {line: 3764, column: 50}} | {depth: 2, level: 2} |
| link | /home/modules/programs/pi.nix | {start: {line: 3776, column: 4}, end: {line: 3776, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix} |
| text | funkcia.hm.programs.pi.settings | {start: {line: 3780, column: 4}, end: {line: 3780, column: 39}} | {depth: 2, level: 2} |
| link | /home/modules/programs/pi.nix | {start: {line: 3792, column: 4}, end: {line: 3792, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix} |
| text | funkcia.hm.programs.pi.settings.packages | {start: {line: 3796, column: 4}, end: {line: 3796, column: 49}} | {depth: 2, level: 2} |
| code | [ ] | {start: {line: 3811, column: 1}, end: {line: 3813, column: 4}} | {lang: nix} |
| link | /home/modules/programs/pi.nix | {start: {line: 3816, column: 4}, end: {line: 3816, column: 111}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix} |
| text | funkcia.hm.ricing.transparency.enable | {start: {line: 3820, column: 4}, end: {line: 3820, column: 45}} | {depth: 2, level: 2} |
| code | true | {start: {line: 3835, column: 1}, end: {line: 3837, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3843, column: 1}, end: {line: 3845, column: 4}} | {lang: nix} |
| link | /home/modules/ricing/transparency.nix | {start: {line: 3848, column: 4}, end: {line: 3848, column: 127}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/ricing/transparency.nix} |
| text | funkcia.hm.ricing.transparency.onlyTerminal | {start: {line: 3852, column: 4}, end: {line: 3852, column: 51}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3867, column: 1}, end: {line: 3869, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3875, column: 1}, end: {line: 3877, column: 4}} | {lang: nix} |
| link | /home/modules/ricing/transparency.nix | {start: {line: 3880, column: 4}, end: {line: 3880, column: 127}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/ricing/transparency.nix} |
| text | funkcia.hm.ricing.transparency.opacity | {start: {line: 3884, column: 4}, end: {line: 3884, column: 46}} | {depth: 2, level: 2} |
| code | 0.85 | {start: {line: 3899, column: 1}, end: {line: 3901, column: 4}} | {lang: nix} |
| link | /home/modules/ricing/transparency.nix | {start: {line: 3904, column: 4}, end: {line: 3904, column: 127}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/ricing/transparency.nix} |
| text | funkcia.hm.wine.enable | {start: {line: 3908, column: 4}, end: {line: 3908, column: 29}} | {depth: 2, level: 2} |
| code | false | {start: {line: 3923, column: 1}, end: {line: 3925, column: 4}} | {lang: nix} |
| code | true | {start: {line: 3931, column: 1}, end: {line: 3933, column: 4}} | {lang: nix} |
| link | /home/modules/wine.nix | {start: {line: 3936, column: 4}, end: {line: 3936, column: 97}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/wine.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.archiveFormats | {start: {line: 3940, column: 4}, end: {line: 3940, column: 63}} | {depth: 2, level: 2} |
| text | application/x-7z-compressed | {start: {line: 3947, column: 4}, end: {line: 3947, column: 31}} | {level: 0, ordered: false} |
| text | application/x-rar-compressed | {start: {line: 3948, column: 4}, end: {line: 3948, column: 32}} | {level: 0, ordered: false} |
| text | application/x-gtar | {start: {line: 3949, column: 4}, end: {line: 3949, column: 22}} | {level: 0, ordered: false} |
| text | application/zip | {start: {line: 3950, column: 4}, end: {line: 3950, column: 19}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 3961, column: 1}, end: {line: 3963, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 3966, column: 4}, end: {line: 3966, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.audioFormats | {start: {line: 3970, column: 4}, end: {line: 3970, column: 61}} | {depth: 2, level: 2} |
| text | audio/ogg | {start: {line: 3977, column: 4}, end: {line: 3977, column: 13}} | {level: 0, ordered: false} |
| text | audio/vorbis | {start: {line: 3978, column: 4}, end: {line: 3978, column: 16}} | {level: 0, ordered: false} |
| text | audio/x-vorbis | {start: {line: 3979, column: 4}, end: {line: 3979, column: 18}} | {level: 0, ordered: false} |
| text | audio/x-speex | {start: {line: 3980, column: 4}, end: {line: 3980, column: 17}} | {level: 0, ordered: false} |
| text | audio/opus | {start: {line: 3981, column: 4}, end: {line: 3981, column: 14}} | {level: 0, ordered: false} |
| text | audio/flac | {start: {line: 3982, column: 4}, end: {line: 3982, column: 14}} | {level: 0, ordered: false} |
| text | audio/x-flac | {start: {line: 3983, column: 4}, end: {line: 3983, column: 16}} | {level: 0, ordered: false} |
| text | audio/x-ms-asf | {start: {line: 3984, column: 4}, end: {line: 3984, column: 18}} | {level: 0, ordered: false} |
| text | audio/x-ms-asx | {start: {line: 3985, column: 4}, end: {line: 3985, column: 18}} | {level: 0, ordered: false} |
| text | audio/x-ms-wax | {start: {line: 3986, column: 4}, end: {line: 3986, column: 18}} | {level: 0, ordered: false} |
| text | audio/x-ms-wma | {start: {line: 3987, column: 4}, end: {line: 3987, column: 18}} | {level: 0, ordered: false} |
| text | audio/x-pn-windows-acm | {start: {line: 3988, column: 4}, end: {line: 3988, column: 26}} | {level: 0, ordered: false} |
| text | audio/vnd.rn-realaudio | {start: {line: 3989, column: 4}, end: {line: 3989, column: 27}} | {level: 0, ordered: false} |
| text | audio/x-pn-realaudio | {start: {line: 3990, column: 4}, end: {line: 3990, column: 24}} | {level: 0, ordered: false} |
| text | audio/x-pn-realaudio-plugin | {start: {line: 3991, column: 4}, end: {line: 3991, column: 31}} | {level: 0, ordered: false} |
| text | audio/x-real-audio | {start: {line: 3992, column: 4}, end: {line: 3992, column: 22}} | {level: 0, ordered: false} |
| text | audio/x-realaudio | {start: {line: 3993, column: 4}, end: {line: 3993, column: 21}} | {level: 0, ordered: false} |
| text | audio/mpeg | {start: {line: 3994, column: 4}, end: {line: 3994, column: 14}} | {level: 0, ordered: false} |
| text | audio/mpg | {start: {line: 3995, column: 4}, end: {line: 3995, column: 13}} | {level: 0, ordered: false} |
| text | audio/mp1 | {start: {line: 3996, column: 4}, end: {line: 3996, column: 13}} | {level: 0, ordered: false} |
| text | audio/mp2 | {start: {line: 3997, column: 4}, end: {line: 3997, column: 13}} | {level: 0, ordered: false} |
| text | audio/mp3 | {start: {line: 3998, column: 4}, end: {line: 3998, column: 13}} | {level: 0, ordered: false} |
| text | audio/x-mp1 | {start: {line: 3999, column: 4}, end: {line: 3999, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-mp2 | {start: {line: 4000, column: 4}, end: {line: 4000, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-mp3 | {start: {line: 4001, column: 4}, end: {line: 4001, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-mpeg | {start: {line: 4002, column: 4}, end: {line: 4002, column: 16}} | {level: 0, ordered: false} |
| text | audio/x-mpg | {start: {line: 4003, column: 4}, end: {line: 4003, column: 15}} | {level: 0, ordered: false} |
| text | audio/aac | {start: {line: 4004, column: 4}, end: {line: 4004, column: 13}} | {level: 0, ordered: false} |
| text | audio/m4a | {start: {line: 4005, column: 4}, end: {line: 4005, column: 13}} | {level: 0, ordered: false} |
| text | audio/mp4 | {start: {line: 4006, column: 4}, end: {line: 4006, column: 13}} | {level: 0, ordered: false} |
| text | audio/x-m4a | {start: {line: 4007, column: 4}, end: {line: 4007, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-aac | {start: {line: 4008, column: 4}, end: {line: 4008, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-matroska | {start: {line: 4009, column: 4}, end: {line: 4009, column: 20}} | {level: 0, ordered: false} |
| text | audio/webm | {start: {line: 4010, column: 4}, end: {line: 4010, column: 14}} | {level: 0, ordered: false} |
| text | audio/3gpp | {start: {line: 4011, column: 4}, end: {line: 4011, column: 14}} | {level: 0, ordered: false} |
| text | audio/3gpp2 | {start: {line: 4012, column: 4}, end: {line: 4012, column: 15}} | {level: 0, ordered: false} |
| text | audio/AMR | {start: {line: 4013, column: 4}, end: {line: 4013, column: 13}} | {level: 0, ordered: false} |
| text | audio/AMR-WB | {start: {line: 4014, column: 4}, end: {line: 4014, column: 16}} | {level: 0, ordered: false} |
| text | audio/mpegurl | {start: {line: 4015, column: 4}, end: {line: 4015, column: 17}} | {level: 0, ordered: false} |
| text | audio/x-mpegurl | {start: {line: 4016, column: 4}, end: {line: 4016, column: 19}} | {level: 0, ordered: false} |
| text | audio/scpls | {start: {line: 4017, column: 4}, end: {line: 4017, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-scpls | {start: {line: 4018, column: 4}, end: {line: 4018, column: 17}} | {level: 0, ordered: false} |
| text | audio/dv | {start: {line: 4019, column: 4}, end: {line: 4019, column: 12}} | {level: 0, ordered: false} |
| text | audio/x-aiff | {start: {line: 4020, column: 4}, end: {line: 4020, column: 16}} | {level: 0, ordered: false} |
| text | audio/x-pn-aiff | {start: {line: 4021, column: 4}, end: {line: 4021, column: 19}} | {level: 0, ordered: false} |
| text | audio/wav | {start: {line: 4022, column: 4}, end: {line: 4022, column: 13}} | {level: 0, ordered: false} |
| text | audio/x-pn-au | {start: {line: 4023, column: 4}, end: {line: 4023, column: 17}} | {level: 0, ordered: false} |
| text | audio/x-pn-wav | {start: {line: 4024, column: 4}, end: {line: 4024, column: 18}} | {level: 0, ordered: false} |
| text | audio/x-wav | {start: {line: 4025, column: 4}, end: {line: 4025, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-adpcm | {start: {line: 4026, column: 4}, end: {line: 4026, column: 17}} | {level: 0, ordered: false} |
| text | audio/ac3 | {start: {line: 4027, column: 4}, end: {line: 4027, column: 13}} | {level: 0, ordered: false} |
| text | audio/eac3 | {start: {line: 4028, column: 4}, end: {line: 4028, column: 14}} | {level: 0, ordered: false} |
| text | audio/vnd.dts | {start: {line: 4029, column: 4}, end: {line: 4029, column: 18}} | {level: 0, ordered: false} |
| text | audio/vnd.dts.hd | {start: {line: 4030, column: 4}, end: {line: 4030, column: 22}} | {level: 0, ordered: false} |
| text | audio/vnd.dolby.heaac.1 | {start: {line: 4031, column: 4}, end: {line: 4031, column: 30}} | {level: 0, ordered: false} |
| text | audio/vnd.dolby.heaac.2 | {start: {line: 4032, column: 4}, end: {line: 4032, column: 30}} | {level: 0, ordered: false} |
| text | audio/vnd.dolby.mlp | {start: {line: 4033, column: 4}, end: {line: 4033, column: 25}} | {level: 0, ordered: false} |
| text | audio/basic | {start: {line: 4034, column: 4}, end: {line: 4034, column: 15}} | {level: 0, ordered: false} |
| text | audio/midi | {start: {line: 4035, column: 4}, end: {line: 4035, column: 14}} | {level: 0, ordered: false} |
| text | audio/x-ape | {start: {line: 4036, column: 4}, end: {line: 4036, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-gsm | {start: {line: 4037, column: 4}, end: {line: 4037, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-musepack | {start: {line: 4038, column: 4}, end: {line: 4038, column: 20}} | {level: 0, ordered: false} |
| text | audio/x-tta | {start: {line: 4039, column: 4}, end: {line: 4039, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-wavpack | {start: {line: 4040, column: 4}, end: {line: 4040, column: 19}} | {level: 0, ordered: false} |
| text | audio/x-shorten | {start: {line: 4041, column: 4}, end: {line: 4041, column: 19}} | {level: 0, ordered: false} |
| text | audio/x-it | {start: {line: 4042, column: 4}, end: {line: 4042, column: 14}} | {level: 0, ordered: false} |
| text | audio/x-mod | {start: {line: 4043, column: 4}, end: {line: 4043, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-s3m | {start: {line: 4044, column: 4}, end: {line: 4044, column: 15}} | {level: 0, ordered: false} |
| text | audio/x-xm | {start: {line: 4045, column: 4}, end: {line: 4045, column: 14}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4056, column: 1}, end: {line: 4058, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4061, column: 4}, end: {line: 4061, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.ebookFormats | {start: {line: 4065, column: 4}, end: {line: 4065, column: 61}} | {depth: 2, level: 2} |
| text | application/x-mobipocket-ebook | {start: {line: 4072, column: 4}, end: {line: 4072, column: 34}} | {level: 0, ordered: false} |
| text | application/vnd.amazon.ebook | {start: {line: 4073, column: 4}, end: {line: 4073, column: 34}} | {level: 0, ordered: false} |
| text | application/vnd.amazon.mobi8-ebook | {start: {line: 4074, column: 4}, end: {line: 4074, column: 40}} | {level: 0, ordered: false} |
| text | application/x-fictionbook+xml | {start: {line: 4075, column: 4}, end: {line: 4075, column: 33}} | {level: 0, ordered: false} |
| text | application/vnd.comicbook+zip | {start: {line: 4076, column: 4}, end: {line: 4076, column: 34}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4087, column: 1}, end: {line: 4089, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4092, column: 4}, end: {line: 4092, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.excelFormats | {start: {line: 4096, column: 4}, end: {line: 4096, column: 61}} | {depth: 2, level: 2} |
| text | application/vnd.openxmlformats-officedocument.spreadsheetml.sheet | {start: {line: 4103, column: 4}, end: {line: 4103, column: 72}} | {level: 0, ordered: false} |
| text | application/vnd.openxmlformats-officedocument.spreadsheetml.template | {start: {line: 4104, column: 4}, end: {line: 4104, column: 75}} | {level: 0, ordered: false} |
| text | application/vnd.ms-excel.sheet.macroEnabled.12 | {start: {line: 4105, column: 4}, end: {line: 4105, column: 54}} | {level: 0, ordered: false} |
| text | application/vnd.ms-excel.template.macroEnabled.12 | {start: {line: 4106, column: 4}, end: {line: 4106, column: 57}} | {level: 0, ordered: false} |
| text | application/vnd.ms-excel.addin.macroEnabled.12 | {start: {line: 4107, column: 4}, end: {line: 4107, column: 54}} | {level: 0, ordered: false} |
| text | application/vnd.ms-excel.sheet.binary.macroEnabled.12 | {start: {line: 4108, column: 4}, end: {line: 4108, column: 62}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4119, column: 1}, end: {line: 4121, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4124, column: 4}, end: {line: 4124, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.explorerFormats | {start: {line: 4128, column: 4}, end: {line: 4128, column: 64}} | {depth: 2, level: 2} |
| text | x-scheme-handler/file | {start: {line: 4135, column: 4}, end: {line: 4135, column: 25}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4146, column: 1}, end: {line: 4148, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4151, column: 4}, end: {line: 4151, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.imageFormats | {start: {line: 4155, column: 4}, end: {line: 4155, column: 61}} | {depth: 2, level: 2} |
| text | image/bmp | {start: {line: 4162, column: 4}, end: {line: 4162, column: 13}} | {level: 0, ordered: false} |
| text | image/gif | {start: {line: 4163, column: 4}, end: {line: 4163, column: 13}} | {level: 0, ordered: false} |
| text | image/jpg | {start: {line: 4164, column: 4}, end: {line: 4164, column: 13}} | {level: 0, ordered: false} |
| text | image/pjpeg | {start: {line: 4165, column: 4}, end: {line: 4165, column: 15}} | {level: 0, ordered: false} |
| text | image/png | {start: {line: 4166, column: 4}, end: {line: 4166, column: 13}} | {level: 0, ordered: false} |
| text | image/tiff | {start: {line: 4167, column: 4}, end: {line: 4167, column: 14}} | {level: 0, ordered: false} |
| text | image/x-bmp | {start: {line: 4168, column: 4}, end: {line: 4168, column: 15}} | {level: 0, ordered: false} |
| text | image/x-gray | {start: {line: 4169, column: 4}, end: {line: 4169, column: 16}} | {level: 0, ordered: false} |
| text | image/x-icb | {start: {line: 4170, column: 4}, end: {line: 4170, column: 15}} | {level: 0, ordered: false} |
| text | image/x-ico | {start: {line: 4171, column: 4}, end: {line: 4171, column: 15}} | {level: 0, ordered: false} |
| text | image/x-png | {start: {line: 4172, column: 4}, end: {line: 4172, column: 15}} | {level: 0, ordered: false} |
| text | image/x-portable-anymap | {start: {line: 4173, column: 4}, end: {line: 4173, column: 27}} | {level: 0, ordered: false} |
| text | image/x-portable-bitmap | {start: {line: 4174, column: 4}, end: {line: 4174, column: 27}} | {level: 0, ordered: false} |
| text | image/x-portable-graymap | {start: {line: 4175, column: 4}, end: {line: 4175, column: 28}} | {level: 0, ordered: false} |
| text | image/x-portable-pixmap | {start: {line: 4176, column: 4}, end: {line: 4176, column: 27}} | {level: 0, ordered: false} |
| text | image/x-xbitmap | {start: {line: 4177, column: 4}, end: {line: 4177, column: 19}} | {level: 0, ordered: false} |
| text | image/x-xpixmap | {start: {line: 4178, column: 4}, end: {line: 4178, column: 19}} | {level: 0, ordered: false} |
| text | image/x-pcx | {start: {line: 4179, column: 4}, end: {line: 4179, column: 15}} | {level: 0, ordered: false} |
| text | image/x-icns | {start: {line: 4180, column: 4}, end: {line: 4180, column: 16}} | {level: 0, ordered: false} |
| text | image/svg+xml | {start: {line: 4181, column: 4}, end: {line: 4181, column: 17}} | {level: 0, ordered: false} |
| text | image/svg+xml-compressed | {start: {line: 4182, column: 4}, end: {line: 4182, column: 28}} | {level: 0, ordered: false} |
| text | image/vnd.wap.wbmp | {start: {line: 4183, column: 4}, end: {line: 4183, column: 24}} | {level: 0, ordered: false} |
| text | image/webp | {start: {line: 4184, column: 4}, end: {line: 4184, column: 14}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4195, column: 1}, end: {line: 4197, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4200, column: 4}, end: {line: 4200, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.mailFormats | {start: {line: 4204, column: 4}, end: {line: 4204, column: 60}} | {depth: 2, level: 2} |
| code | [ ] | {start: {line: 4220, column: 1}, end: {line: 4222, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4225, column: 4}, end: {line: 4225, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.pptFormats | {start: {line: 4229, column: 4}, end: {line: 4229, column: 59}} | {depth: 2, level: 2} |
| text | application/vnd.openxmlformats-officedocument.presentationml.presentation | {start: {line: 4236, column: 4}, end: {line: 4236, column: 80}} | {level: 0, ordered: false} |
| text | application/vnd.openxmlformats-officedocument.presentationml.template | {start: {line: 4237, column: 4}, end: {line: 4237, column: 76}} | {level: 0, ordered: false} |
| text | application/vnd.openxmlformats-officedocument.presentationml.slideshow | {start: {line: 4238, column: 4}, end: {line: 4238, column: 77}} | {level: 0, ordered: false} |
| text | application/vnd.ms-powerpoint.addin.macroEnabled.12 | {start: {line: 4239, column: 4}, end: {line: 4239, column: 59}} | {level: 0, ordered: false} |
| text | application/vnd.ms-powerpoint.presentation.macroEnabled.12 | {start: {line: 4240, column: 4}, end: {line: 4240, column: 66}} | {level: 0, ordered: false} |
| text | application/vnd.ms-powerpoint.template.macroEnabled.12 | {start: {line: 4241, column: 4}, end: {line: 4241, column: 62}} | {level: 0, ordered: false} |
| text | application/vnd.ms-powerpoint.slideshow.macroEnabled.12 | {start: {line: 4242, column: 4}, end: {line: 4242, column: 63}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4253, column: 1}, end: {line: 4255, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4258, column: 4}, end: {line: 4258, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.videoFormats | {start: {line: 4262, column: 4}, end: {line: 4262, column: 61}} | {depth: 2, level: 2} |
| text | video/ogg | {start: {line: 4269, column: 4}, end: {line: 4269, column: 13}} | {level: 0, ordered: false} |
| text | video/x-ogm | {start: {line: 4270, column: 4}, end: {line: 4270, column: 15}} | {level: 0, ordered: false} |
| text | video/x-theora+ogg | {start: {line: 4271, column: 4}, end: {line: 4271, column: 22}} | {level: 0, ordered: false} |
| text | video/x-theora | {start: {line: 4272, column: 4}, end: {line: 4272, column: 18}} | {level: 0, ordered: false} |
| text | video/x-ms-asf | {start: {line: 4273, column: 4}, end: {line: 4273, column: 18}} | {level: 0, ordered: false} |
| text | video/x-ms-asf-plugin | {start: {line: 4274, column: 4}, end: {line: 4274, column: 25}} | {level: 0, ordered: false} |
| text | video/x-ms-asx | {start: {line: 4275, column: 4}, end: {line: 4275, column: 18}} | {level: 0, ordered: false} |
| text | video/x-ms-wm | {start: {line: 4276, column: 4}, end: {line: 4276, column: 17}} | {level: 0, ordered: false} |
| text | video/x-ms-wmv | {start: {line: 4277, column: 4}, end: {line: 4277, column: 18}} | {level: 0, ordered: false} |
| text | video/x-ms-wmx | {start: {line: 4278, column: 4}, end: {line: 4278, column: 18}} | {level: 0, ordered: false} |
| text | video/x-ms-wvx | {start: {line: 4279, column: 4}, end: {line: 4279, column: 18}} | {level: 0, ordered: false} |
| text | video/x-msvideo | {start: {line: 4280, column: 4}, end: {line: 4280, column: 19}} | {level: 0, ordered: false} |
| text | video/divx | {start: {line: 4281, column: 4}, end: {line: 4281, column: 14}} | {level: 0, ordered: false} |
| text | video/msvideo | {start: {line: 4282, column: 4}, end: {line: 4282, column: 17}} | {level: 0, ordered: false} |
| text | video/vnd.divx | {start: {line: 4283, column: 4}, end: {line: 4283, column: 19}} | {level: 0, ordered: false} |
| text | video/avi | {start: {line: 4284, column: 4}, end: {line: 4284, column: 13}} | {level: 0, ordered: false} |
| text | video/x-avi | {start: {line: 4285, column: 4}, end: {line: 4285, column: 15}} | {level: 0, ordered: false} |
| text | video/vnd.rn-realvideo | {start: {line: 4286, column: 4}, end: {line: 4286, column: 27}} | {level: 0, ordered: false} |
| text | video/mp2t | {start: {line: 4287, column: 4}, end: {line: 4287, column: 14}} | {level: 0, ordered: false} |
| text | video/mpeg | {start: {line: 4288, column: 4}, end: {line: 4288, column: 14}} | {level: 0, ordered: false} |
| text | video/mpeg-system | {start: {line: 4289, column: 4}, end: {line: 4289, column: 21}} | {level: 0, ordered: false} |
| text | video/x-mpeg | {start: {line: 4290, column: 4}, end: {line: 4290, column: 16}} | {level: 0, ordered: false} |
| text | video/x-mpeg2 | {start: {line: 4291, column: 4}, end: {line: 4291, column: 17}} | {level: 0, ordered: false} |
| text | video/x-mpeg-system | {start: {line: 4292, column: 4}, end: {line: 4292, column: 23}} | {level: 0, ordered: false} |
| text | video/mp4 | {start: {line: 4293, column: 4}, end: {line: 4293, column: 13}} | {level: 0, ordered: false} |
| text | video/mp4v-es | {start: {line: 4294, column: 4}, end: {line: 4294, column: 17}} | {level: 0, ordered: false} |
| text | video/x-m4v | {start: {line: 4295, column: 4}, end: {line: 4295, column: 15}} | {level: 0, ordered: false} |
| text | video/quicktime | {start: {line: 4296, column: 4}, end: {line: 4296, column: 19}} | {level: 0, ordered: false} |
| text | video/x-matroska | {start: {line: 4297, column: 4}, end: {line: 4297, column: 20}} | {level: 0, ordered: false} |
| text | video/webm | {start: {line: 4298, column: 4}, end: {line: 4298, column: 14}} | {level: 0, ordered: false} |
| text | video/3gp | {start: {line: 4299, column: 4}, end: {line: 4299, column: 13}} | {level: 0, ordered: false} |
| text | video/3gpp | {start: {line: 4300, column: 4}, end: {line: 4300, column: 14}} | {level: 0, ordered: false} |
| text | video/3gpp2 | {start: {line: 4301, column: 4}, end: {line: 4301, column: 15}} | {level: 0, ordered: false} |
| text | video/vnd.mpegurl | {start: {line: 4302, column: 4}, end: {line: 4302, column: 22}} | {level: 0, ordered: false} |
| text | video/dv | {start: {line: 4303, column: 4}, end: {line: 4303, column: 12}} | {level: 0, ordered: false} |
| text | video/x-anim | {start: {line: 4304, column: 4}, end: {line: 4304, column: 16}} | {level: 0, ordered: false} |
| text | video/x-nsv | {start: {line: 4305, column: 4}, end: {line: 4305, column: 15}} | {level: 0, ordered: false} |
| text | video/fli | {start: {line: 4306, column: 4}, end: {line: 4306, column: 13}} | {level: 0, ordered: false} |
| text | video/flv | {start: {line: 4307, column: 4}, end: {line: 4307, column: 13}} | {level: 0, ordered: false} |
| text | video/x-flc | {start: {line: 4308, column: 4}, end: {line: 4308, column: 15}} | {level: 0, ordered: false} |
| text | video/x-fli | {start: {line: 4309, column: 4}, end: {line: 4309, column: 15}} | {level: 0, ordered: false} |
| text | video/x-flv | {start: {line: 4310, column: 4}, end: {line: 4310, column: 15}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4321, column: 1}, end: {line: 4323, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4326, column: 4}, end: {line: 4326, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.webFormats | {start: {line: 4330, column: 4}, end: {line: 4330, column: 59}} | {depth: 2, level: 2} |
| text | x-scheme-handler/https | {start: {line: 4337, column: 4}, end: {line: 4337, column: 26}} | {level: 0, ordered: false} |
| text | text/html | {start: {line: 4338, column: 4}, end: {line: 4338, column: 13}} | {level: 0, ordered: false} |
| text | application/xhtml+xml | {start: {line: 4339, column: 4}, end: {line: 4339, column: 25}} | {level: 0, ordered: false} |
| text | application/x-extension-htm | {start: {line: 4340, column: 4}, end: {line: 4340, column: 31}} | {level: 0, ordered: false} |
| text | application/x-extension-html | {start: {line: 4341, column: 4}, end: {line: 4341, column: 32}} | {level: 0, ordered: false} |
| text | application/x-extension-shtml | {start: {line: 4342, column: 4}, end: {line: 4342, column: 33}} | {level: 0, ordered: false} |
| text | application/x-extension-xhtml | {start: {line: 4343, column: 4}, end: {line: 4343, column: 33}} | {level: 0, ordered: false} |
| text | application/x-extension-xht | {start: {line: 4344, column: 4}, end: {line: 4344, column: 31}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4355, column: 1}, end: {line: 4357, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4360, column: 4}, end: {line: 4360, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.hm.xdg.mime.defaultApplications.wordFormats | {start: {line: 4364, column: 4}, end: {line: 4364, column: 60}} | {depth: 2, level: 2} |
| text | application/vnd.openxmlformats-officedocument.wordprocessingml.document | {start: {line: 4371, column: 4}, end: {line: 4371, column: 78}} | {level: 0, ordered: false} |
| text | application/vnd.openxmlformats-officedocument.wordprocessingml.template | {start: {line: 4372, column: 4}, end: {line: 4372, column: 78}} | {level: 0, ordered: false} |
| text | application/vnd.ms-word.document.macroEnabled.12 | {start: {line: 4373, column: 4}, end: {line: 4373, column: 56}} | {level: 0, ordered: false} |
| text | application/vnd.ms-word.template.macroEnabled.12 | {start: {line: 4374, column: 4}, end: {line: 4374, column: 56}} | {level: 0, ordered: false} |
| code | [ ] | {start: {line: 4385, column: 1}, end: {line: 4387, column: 4}} | {lang: nix} |
| link | /home/modules/mime/defaultApplications.nix | {start: {line: 4390, column: 4}, end: {line: 4390, column: 137}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix} |
| text | funkcia.install-dir | {start: {line: 4394, column: 4}, end: {line: 4394, column: 24}} | {depth: 2, level: 2} |
| code | toString (osConfig.funkcia.install-dir or (funkcia-utils.projectPath ./.))
 | {start: {line: 4409, column: 1}, end: {line: 4412, column: 4}} | {lang: nix} |
| link | /home/modules/options.nix | {start: {line: 4415, column: 4}, end: {line: 4415, column: 103}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/options.nix} |
| text | User Modules for linca | {start: {line: 4418, column: 3}, end: {line: 4418, column: 25}} | {depth: 1, level: 1} |
| text | linca.gpg.pk.enable | {start: {line: 4419, column: 4}, end: {line: 4419, column: 26}} | {depth: 2, level: 2} |
| code | false | {start: {line: 4433, column: 1}, end: {line: 4435, column: 4}} | {lang: nix} |
| code | true | {start: {line: 4441, column: 1}, end: {line: 4443, column: 4}} | {lang: nix} |
| link | /home/linca/modules/gpg.nix | {start: {line: 4446, column: 4}, end: {line: 4446, column: 107}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/gpg.nix} |
| text | linca.play.enable | {start: {line: 4450, column: 4}, end: {line: 4450, column: 23}} | {depth: 2, level: 2} |
| code | false | {start: {line: 4465, column: 1}, end: {line: 4467, column: 4}} | {lang: nix} |
| code | true | {start: {line: 4473, column: 1}, end: {line: 4475, column: 4}} | {lang: nix} |
| link | /home/linca/modules/play.nix | {start: {line: 4478, column: 4}, end: {line: 4478, column: 109}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/play.nix} |
| text | linca.rclone.enable | {start: {line: 4482, column: 4}, end: {line: 4482, column: 25}} | {depth: 2, level: 2} |
| code | false | {start: {line: 4497, column: 1}, end: {line: 4499, column: 4}} | {lang: nix} |
| code | true | {start: {line: 4505, column: 1}, end: {line: 4507, column: 4}} | {lang: nix} |
| link | /home/linca/modules/rclone.nix | {start: {line: 4510, column: 4}, end: {line: 4510, column: 113}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/rclone.nix} |
| text | linca.sops.enable | {start: {line: 4514, column: 4}, end: {line: 4514, column: 23}} | {depth: 2, level: 2} |
| code | true | {start: {line: 4529, column: 1}, end: {line: 4531, column: 4}} | {lang: nix} |
| code | true | {start: {line: 4537, column: 1}, end: {line: 4539, column: 4}} | {lang: nix} |
| link | /home/linca/modules/sops.nix | {start: {line: 4542, column: 4}, end: {line: 4542, column: 109}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/sops.nix} |
| text | linca.tex.enable | {start: {line: 4546, column: 4}, end: {line: 4546, column: 22}} | {depth: 2, level: 2} |
| code | false | {start: {line: 4561, column: 1}, end: {line: 4563, column: 4}} | {lang: nix} |
| code | true | {start: {line: 4569, column: 1}, end: {line: 4571, column: 4}} | {lang: nix} |
| link | /home/linca/modules/tex.nix | {start: {line: 4574, column: 4}, end: {line: 4574, column: 107}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/tex.nix} |
| text | linca.work.enable | {start: {line: 4578, column: 4}, end: {line: 4578, column: 23}} | {depth: 2, level: 2} |
| code | false | {start: {line: 4593, column: 1}, end: {line: 4595, column: 4}} | {lang: nix} |
| code | true | {start: {line: 4601, column: 1}, end: {line: 4603, column: 4}} | {lang: nix} |
| link | /home/linca/modules/work.nix | {start: {line: 4606, column: 4}, end: {line: 4606, column: 109}} | {level: 0, ordered: false, url: https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/work.nix} |