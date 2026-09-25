<!-- This documentation is AUTO-GENERATED -->
<!-- by  -->
<!-- NEVER EDIT this documentation -->
# NixOS Modules
## funkcia\.os\.btrbk\.home\.enable

Whether to enable btrbk snapshot backup of the home subvolume\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/btrbk\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/btrbk.nix)



## funkcia\.os\.configure-ip\.enable



Whether to enable configure ip by sops-nix\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/configure-ip\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/configure-ip.nix)



## funkcia\.os\.configure-ip\.v4



match the device



*Type:*
attribute set of (submodule)

*Declared by:*
 - [/modules/configure-ip\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/configure-ip.nix)



## funkcia\.os\.configure-ip\.v4\.\<name>\.addr



IPv4 地址。例如 123\.45\.67\.89

可能为机密的值。设置为下列两种值的一种。

 - **明文**：此时直接设置值，比如 ` "123.45.67.89" `

 - **密文**：此时设置 secret = key，比如，如果 ` config.sops.placeholder.key-name ` 是对应了 ` "123.45.67.89" ` 的 sops，则设置为：

```nix
{ secret = "key-name"; }
```



*Type:*
string or (submodule)



*Example:*

```nix
{
  secret = "key-name";
}
```

*Declared by:*
 - [/modules/configure-ip\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/configure-ip.nix)



## funkcia\.os\.configure-ip\.v4\.\<name>\.gateway



网关, 例如 1\.2\.3\.4

可能为机密的值。设置为下列两种值的一种。

 - **明文**：此时直接设置值，比如 ` "123.45.67.89" `

 - **密文**：此时设置 secret = key，比如，如果 ` config.sops.placeholder.key-name ` 是对应了 ` "123.45.67.89" ` 的 sops，则设置为：

```nix
{ secret = "key-name"; }
```



*Type:*
string or (submodule)



*Example:*

```nix
{
  secret = "key-name";
}
```

*Declared by:*
 - [/modules/configure-ip\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/configure-ip.nix)



## funkcia\.os\.configure-ip\.v4\.\<name>\.mask



子网掩码。例如 32

可能为机密的值。设置为下列两种值的一种。

 - **明文**：此时直接设置值，比如 ` "123.45.67.89" `

 - **密文**：此时设置 secret = key，比如，如果 ` config.sops.placeholder.key-name ` 是对应了 ` "123.45.67.89" ` 的 sops，则设置为：

```nix
{ secret = "key-name"; }
```



*Type:*
string or (submodule)



*Example:*

```nix
{
  secret = "key-name";
}
```

*Declared by:*
 - [/modules/configure-ip\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/configure-ip.nix)



## funkcia\.os\.displayManager\.ly\.enable



Whether to enable ly module, which is a TUI login manager (or display manager)…



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/displayManager/ly\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/displayManager/ly.nix)



## funkcia\.os\.displayManager\.noctalia-greeter\.enable



Whether to enable noctalia-greeter module, which is a TUI login manager (or display manager)…



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/displayManager/noctalia-greeter\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/displayManager/noctalia-greeter.nix)



## funkcia\.os\.displayManager\.sddm\.enable



Whether to enable sddm module, which is a GUI login manager (or display manager)…



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/displayManager/sddm\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/displayManager/sddm.nix)



## funkcia\.os\.displayManager\.sddm\.theme\.config



theme config of the theme\.



*Type:*
JSON value



*Default:*

```nix
{ }
```



*Example:*

```nix
{
  Background = "Backgrounds/your-custom-background.png";
  HeaderTextColor = "#d5c4a1";
}
```

*Declared by:*
 - [/modules/displayManager/sddm\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/displayManager/sddm.nix)



## funkcia\.os\.displayManager\.sddm\.theme\.name



theme name of sddm-astronaut-theme\. see https://github\.com/Keyitdev/sddm-astronaut-theme/tree/master/Themes



*Type:*
string



*Default:*

```nix
"hyprland_kath"
```

*Declared by:*
 - [/modules/displayManager/sddm\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/displayManager/sddm.nix)



## funkcia\.os\.domain\.suffix



This option has no description\.



*Type:*
string

*Declared by:*
 - [/modules/domains\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/domains.nix)



## funkcia\.os\.domains



This option has no description\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [/modules/domains\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/domains.nix)



## funkcia\.os\.domains\.\<name>\.value



This option has no description\.



*Type:*
string



*Default:*
` <name>.<funkcia.os.domain.suffix> `

*Declared by:*
 - [/modules/domains\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/domains.nix)



## funkcia\.os\.fingerprint\.enable



Whether to enable fingerprint module\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/fingerprint\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/fingerprint.nix)



## funkcia\.os\.fingerprint\.todDriver



If simply enabling fprintd is not enough, try enabling fprintd\.tod, and use one of the next four drivers:

 - pkgs\.libfprint-2-tod1-elan; \# Elan(04f3:0c4b) driver
 - pkgs\.libfprint-2-tod1-vfs0090; \# (Marked as broken as of 2025/04/23!) driver for 2016 ThinkPads
 - pkgs\.libfprint-2-tod1-goodix-550a; \# Goodix 550a driver (from Lenovo)

see https://wiki\.nixos\.org/wiki/Fingerprint_scanner



*Type:*
null or package



*Default:*

```nix
null
```

*Declared by:*
 - [/modules/fingerprint\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/fingerprint.nix)



## funkcia\.os\.flatpak\.enable



Whether to enable flatpak\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/flatpak\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/flatpak.nix)



## funkcia\.os\.fonts\.enable



Whether to enable 字体相关设置\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/defaults/fonts\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/fonts.nix)



## funkcia\.os\.gnome-keyring\.enable



Whether to enable GNOME Keyring module\.  
这个模块是为了在 *不使用* GNOME 的情况下启用 Keyring 及其相关服务。
如果使用 GNOME 桌面环境，则不需要此模块。
最初目的是为了在 Hyprland 上使用 Keyring
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/gnome-keyring\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/gnome-keyring.nix)



## funkcia\.os\.gui\.enable



Whether to enable GUI related options\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/gui/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/gui/default.nix)



## funkcia\.os\.gui\.fonts\.enable



Whether to enable 启用 GUI 时的额外字体包\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/gui/fonts\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/gui/fonts.nix)



## funkcia\.os\.gui\.hyprland\.enable



Whether to enable Hyprland and related settings\.
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/gui/hyprland\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/gui/hyprland.nix)



## funkcia\.os\.gui\.isWayland



is wayland



*Type:*
boolean

*Declared by:*
 - [/modules/gui/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/gui/default.nix)



## funkcia\.os\.gui\.niri\.enable



Whether to enable niri, a Wayland WM\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/gui/niri\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/gui/niri.nix)



## funkcia\.os\.gui\.niri\.noctalia\.enable



Whether to enable noctalia shell, a sleek, customizable desktop shell crafted for Wayland\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/gui/niri\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/gui/niri.nix)



## funkcia\.os\.locale\.enable



Whether to enable locale and input settings\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/defaults/locale\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/locale.nix)



## funkcia\.os\.modern-cli-tools\.enable



Whether to enable 现代化的 CLI 工具，包括 fzf, ripgrep 等

对于所有用户生效
\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/defaults/modern-cli-tools\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/modern-cli-tools.nix)



## funkcia\.os\.networking\.enable



Whether to enable networking related settings\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/defaults/networking\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/networking.nix)



## funkcia\.os\.networking\.noProxy



` no_proxy ` 列表：命中的主机不走代理。以 ` . ` 开头表示整个域及其子域，
例如 ` .local ` 覆盖所有 mDNS 名字。



*Type:*
list of string



*Default:*

```nix
[
  "127.0.0.1"
  "localhost"
  "internal.domain"
  ".local"
]
```



*Example:*

```nix
[
  ".lan"
  "example.internal"
]
```

*Declared by:*
 - [/modules/defaults/networking\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/networking.nix)



## funkcia\.os\.networking\.proxy



This option specifies the default value for httpProxy, httpsProxy, ftpProxy and rsyncProxy\.



*Type:*
null or string



*Default:*

```nix
null
```



*Example:*

```nix
"http://127.0.0.1:3128"
```

*Declared by:*
 - [/modules/defaults/networking\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/networking.nix)



## funkcia\.os\.new-cn-install



Whether to enable New CN installation mode, where some packages that require github network access
will be delayed
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/new-install\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/new-install.nix)



## funkcia\.os\.presets\.cn\.enable



Whether to enable 这台机器是 CN 机器\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/presets/cn\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/presets/cn.nix)



## funkcia\.os\.presets\.laptop\.enable



Whether to enable 这台机器为笔记本电脑\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/presets/laptop\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/presets/laptop.nix)



## funkcia\.os\.presets\.laptop\.using



funkcia: Power management tool to use on laptops\.



*Type:*
one of “power-profiles-daemon”, “tlp”



*Default:*

```nix
"power-profiles-daemon"
```

*Declared by:*
 - [/modules/presets/laptop\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/presets/laptop.nix)



## funkcia\.os\.presets\.pc\.enable



Whether to enable 这台机器是日用机器\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/presets/pc\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/presets/pc.nix)



## funkcia\.os\.presets\.server\.enable



Whether to enable 这台机器是服务器机器\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/presets/server\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/presets/server.nix)



## funkcia\.os\.secure-boot\.enable



Whether to enable Secure Boot on your NixOS system using ` lanzaboote ` and ` sbctl `\.

Please refer to https://nix-community\.github\.io/lanzaboote/getting-started/prepare-your-system\.html

The module has been configured to automatically generate and enroll keys\. However,
i don’t know, but if it didn’t works, you may need to prepare your system and
create the necessary keys manually if you prefer\.

**PREPARE YOUR SYSTEM**

Exit “User Mode” in your firmware settings, and enable “Setup Mode”\.

```
sudo sbctl create-keys

# Expected output:
# [sudo] password for linca:
# Created Owner UUID 8ec4b2c3-dc7f-4362-b9a3-0cc17e5a34cd
# Creating secure boot keys...✓
# Secure boot keys created!
```

```
sudo sbctl enroll-keys

# enroll the keys into your firmware.
```

```
sudo sbctl verify

# Verify that your system is ready for Secure Boot.
# Expected output:
# ✓ /boot/EFI/Boot/bootx64.efi is signed
# ✓ /boot/EFI/Linux/nixos-generation-66-pexlogtmhjjwua4micjecfr6p6chnd64d4uauxfkishwlcgyauza.efi is signed
# ✗ /boot/EFI/Microsoft/Boot/zh-TW/memtest.efi.mui is not signed
# ✗ /boot/EFI/nixos/kernel-6.18.2-otn6nn3tkudhh5xpj5736u2q3h4kjzojd6fkg4rqzdf5l5c7gxuq.efi is not signed
# ✓ /boot/EFI/systemd/systemd-bootx64.efi is signed
# It is expected that kernel-xxx and Microsoft files are not signed.
```

\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/secure-boot\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/secure-boot.nix)



## funkcia\.os\.sops-support\.enable



Whether to enable sops support\. disabling it will disable all sops encryptions\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/defaults/sops\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/sops.nix)



## funkcia\.os\.system\.bbr\.enable



Whether to enable replace CUBIC with BBR\.
用 Google BBR 替代默认 CUBIC, 高延迟/丢包网络下吞吐更高、延迟更低，国内网络改善明显。
\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/defaults/system\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/system.nix)



## funkcia\.os\.tpm\.enable



Whether to enable TPM 模块。
see https://nixos\.wiki/wiki/TPM
\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/tpm\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/tpm.nix)



## funkcia\.os\.user



This option has no description\.



*Type:*
attribute set of (submodule)

*Declared by:*
 - [/modules/user\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/user.nix)



## funkcia\.os\.user\.\<name>\.is-admin



Whether to enable admin priviledge\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/user\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/user.nix)



## funkcia\.os\.user\.\<name>\.ssh-login\.enable



Whether to enable SSH login\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/user\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/user.nix)



## funkcia\.os\.winslow-cloud\.enable



Whether to enable winslow-cloud\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/winslow-cloud\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/winslow-cloud.nix)



## funkica\.nix\.lix\.enable



Whether to enable Lix, a fork of Nix\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/modules/defaults/nix\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/modules/defaults/nix.nix)


# Home Manager Modules
## funkcia\.avatar

path of your avatar



*Type:*
null or absolute path



*Default:*

```nix
null
```

*Declared by:*
 - [/home/modules/avatar\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/avatar.nix)



## funkcia\.hm\.gui\.enable



Whether to enable GUI packages\.



*Type:*
boolean



*Default:*

```nix
osConfig.funkcia.os.gui.enable or false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/gui\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/gui.nix)



## funkcia\.hm\.gui\.components\.gnome\.enable



Whether to enable GNOME components\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/components/gnome\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/components/gnome.nix)



## funkcia\.hm\.gui\.components\.gnome\.theme\.package



The packages providing the GTK theme to use for GNOME components



*Type:*
list of package



*Default:*

```nix
[
  <derivation adwaita-icon-theme-50.0>
  <derivation gnome-themes-extra-3.28>
]
```

*Declared by:*
 - [/home/modules/gui/components/gnome\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/components/gnome.nix)



## funkcia\.hm\.gui\.components\.gnome\.theme\.name



The GTK theme to use for GNOME components



*Type:*
string



*Default:*

```nix
"Adwaita"
```

*Declared by:*
 - [/home/modules/gui/components/gnome\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/components/gnome.nix)



## funkcia\.hm\.gui\.components\.kde\.enable



Whether to enable KDE components\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/components/kde\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/components/kde.nix)



## funkcia\.hm\.gui\.libreoffice\.enable



Whether to enable libre office\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/libreoffice\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/libreoffice.nix)



## funkcia\.hm\.gui\.niri\.settings



lines of niri config parts



*Type:*
strings concatenated with “\\n”



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/gui/niri\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/niri.nix)



## funkcia\.hm\.gui\.noctalia\.enable



Whether to manage the Noctalia config\.



*Type:*
boolean



*Default:*

```nix
osConfig.programs.noctalia.enable or false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars



声明式的 noctalia bar



*Type:*
attribute set of (submodule)



*Default:*

```nix
{ }
```

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars\.\<name>\.center



bar 中间的组件



*Type:*
list of (open submodule of attribute set of anything)

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars\.\<name>\.center\.\*\.type



The type of the widget



*Type:*
string

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars\.\<name>\.end



bar 末尾的组件



*Type:*
list of (open submodule of attribute set of anything)

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars\.\<name>\.end\.\*\.type



The type of the widget



*Type:*
string

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars\.\<name>\.settings



bar 的设置



*Type:*
TOML value

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars\.\<name>\.start



bar 前方的组件



*Type:*
list of (open submodule of attribute set of anything)

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.bars\.\<name>\.start\.\*\.type



The type of the widget



*Type:*
string

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.noctalia\.settings



Structured config written to ` ~/.config/noctalia/config.toml ` via
` pkgs.formats.toml ` (nested attrsets become TOML tables and lists of
attrsets become arrays of tables)\.

Noctalia reads every ` *.toml ` directly in that folder (sorted
alphabetically) and merges them; GUI-side overrides are kept separately
in the app-managed ` ~/.local/state/noctalia/settings.toml `, which is
loaded last and wins\.

See https://docs\.noctalia\.dev/noctalia/configuration/ for the schema\.



*Type:*
TOML value



*Default:*

```nix
{ }
```



*Example:*

```nix
{
  bar = {
    default = {
      position = "top";
    };
  };
  theme = {
    mode = "dark";
  };
}
```

*Declared by:*
 - [/home/modules/gui/noctalia\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/noctalia.nix)



## funkcia\.hm\.gui\.umbriel\.settings



lines of umbriel config parts



*Type:*
TOML value



*Default:*

```nix
{ }
```

*Declared by:*
 - [/home/modules/gui/umbriel\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/umbriel.nix)



## funkcia\.hm\.gui\.wm-keybinding\.binds



binds \<key> to actions



*Type:*
attribute set of (submodule)



*Default:*

```nix
{ }
```

*Declared by:*
 - [/home/modules/gui/wm-keybinding/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/wm-keybinding/default.nix)



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions



The action binds to \<key>\. You can only select one action\.



*Type:*
attribute-tagged union with choices: close-window, focus-window-relative, focus-workspace, fullscreen, maximize, move-window-relative, move-window-to-workspace, move-workspace-relative, quit, resize-preset, screenshot, show-help, spawn, spawn-sh, toggle-window-floating

*Declared by:*
 - [/home/modules/gui/wm-keybinding/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/wm-keybinding/default.nix)



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.close-window



close the focused window



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.focus-window-relative



focus window by direction



*Type:*
one of “Left”, “Right”, “Up”, “Down”



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.focus-workspace



focus workspace by id



*Type:*
string or signed integer



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.fullscreen



fullscreen the window



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.maximize



maximize the window



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.move-window-relative



move window by direction



*Type:*
one of “Left”, “Right”, “Up”, “Down”



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.move-window-to-workspace



move window to workspace by id



*Type:*
string or signed integer



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.move-workspace-relative



move workspace by direction



*Type:*
string or signed integer



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.quit



quit shell



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.resize-preset



resize the window



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.screenshot



take a screenshot



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.show-help



show help of commands



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.spawn



spawn command\.



*Type:*
list of string



*Default:*

```nix
[ ]
```



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.spawn-sh



spawn command, with ` sh -c `



*Type:*
string



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.actions\.toggle-window-floating



toggle floating



*Type:*
submodule



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.allow-when-locked



Whether to enable when locked\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/wm-keybinding/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/wm-keybinding/default.nix)



## funkcia\.hm\.gui\.wm-keybinding\.binds\.\<key>\.title



help menu title



*Type:*
null or string



*Default:*

```nix
null
```

*Declared by:*
 - [/home/modules/gui/wm-keybinding/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/wm-keybinding/default.nix)



## funkcia\.hm\.gui\.wm-keybinding\.niri\.enable



Whether to enable keybinding for Niri\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/wm-keybinding/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/wm-keybinding/default.nix)



## funkcia\.hm\.gui\.wm-keybinding\.umbriel\.enable



Whether to enable keybinding for umbriel\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/wm-keybinding/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/wm-keybinding/default.nix)



## funkcia\.hm\.gui\.wm-keybinding\.utils



This option has no description\.



*Type:*
anything

*Declared by:*
 - [/home/modules/gui/wm-keybinding/default\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/wm-keybinding/default.nix)



## funkcia\.hm\.gui\.zen-browser\.enable



Whether to enable Zen Browser\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/zen-browser\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/zen-browser.nix)



## funkcia\.hm\.gui\.zen-browser\.isDefaultBrowser



Whether to enable Zen Browser to be the default browser\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/gui/zen-browser\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/gui/zen-browser.nix)



## funkcia\.hm\.language-sdk\.cpp\.enable



Whether to enable cpp SDK\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/language-sdk/cpp\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/cpp.nix)



## funkcia\.hm\.language-sdk\.javascript\.enable



Whether to enable javascript SDK\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/language-sdk/javascript\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/javascript.nix)



## funkcia\.hm\.language-sdk\.nix\.enable



Whether to enable nix SDK\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/language-sdk/nix\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/nix.nix)



## funkcia\.hm\.language-sdk\.python\.enable



Whether to enable python SDK\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/language-sdk/python\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/language-sdk/python.nix)



## funkcia\.hm\.modern-cli-tools\.enable



Whether to enable 现代化的 CLI 工具，包括 fzf, ripgrep 等

 - zoxide 替换 cd
 - bat 替换 cat
 - eza 替换 ls
 - fzf 作为 fuzzy finder
 - fd 替换 find
 - rg 替换 grep
 - fish 作为 interactive shell
   \.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/modern-cli-tools\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/modern-cli-tools.nix)



## funkcia\.hm\.programs\.pi\.enable



Whether to enable pi coding agent\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/programs/pi\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix)



## funkcia\.hm\.programs\.pi\.auth



auth keys for pi



*Type:*
attribute set of (submodule)

*Declared by:*
 - [/home/modules/programs/pi\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix)



## funkcia\.hm\.programs\.pi\.auth\.\<name>\.key-path



This option has no description\.



*Type:*
string

*Declared by:*
 - [/home/modules/programs/pi\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix)



## funkcia\.hm\.programs\.pi\.auth\.\<name>\.type



This option has no description\.



*Type:*
value “api_key” (singular enum)

*Declared by:*
 - [/home/modules/programs/pi\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix)



## funkcia\.hm\.programs\.pi\.settings



pi settings\.json content (merged into ~/\.pi/agent/settings\.json)



*Type:*
open submodule of attribute set of (JSON value)

*Declared by:*
 - [/home/modules/programs/pi\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix)



## funkcia\.hm\.programs\.pi\.settings\.packages



packages of pi



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/programs/pi\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/programs/pi.nix)



## funkcia\.hm\.ricing\.transparency\.enable



Whether to enable 使得一些软件变得透明\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/ricing/transparency\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/ricing/transparency.nix)



## funkcia\.hm\.ricing\.transparency\.onlyTerminal



Whether to enable 只有终端是透明的\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/ricing/transparency\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/ricing/transparency.nix)



## funkcia\.hm\.ricing\.transparency\.opacity



This option has no description\.



*Type:*
floating point number



*Default:*

```nix
0.85
```

*Declared by:*
 - [/home/modules/ricing/transparency\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/ricing/transparency.nix)



## funkcia\.hm\.wine\.enable



Whether to enable Wine\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/modules/wine\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/wine.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.archiveFormats



default applications for these MIME:
application/x-tar

 - application/x-7z-compressed
 - application/x-rar-compressed
 - application/x-gtar
 - application/zip



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.audioFormats



default applications for these MIME:
audio/x-vorbis+ogg

 - audio/ogg
 - audio/vorbis
 - audio/x-vorbis
 - audio/x-speex
 - audio/opus
 - audio/flac
 - audio/x-flac
 - audio/x-ms-asf
 - audio/x-ms-asx
 - audio/x-ms-wax
 - audio/x-ms-wma
 - audio/x-pn-windows-acm
 - audio/vnd\.rn-realaudio
 - audio/x-pn-realaudio
 - audio/x-pn-realaudio-plugin
 - audio/x-real-audio
 - audio/x-realaudio
 - audio/mpeg
 - audio/mpg
 - audio/mp1
 - audio/mp2
 - audio/mp3
 - audio/x-mp1
 - audio/x-mp2
 - audio/x-mp3
 - audio/x-mpeg
 - audio/x-mpg
 - audio/aac
 - audio/m4a
 - audio/mp4
 - audio/x-m4a
 - audio/x-aac
 - audio/x-matroska
 - audio/webm
 - audio/3gpp
 - audio/3gpp2
 - audio/AMR
 - audio/AMR-WB
 - audio/mpegurl
 - audio/x-mpegurl
 - audio/scpls
 - audio/x-scpls
 - audio/dv
 - audio/x-aiff
 - audio/x-pn-aiff
 - audio/wav
 - audio/x-pn-au
 - audio/x-pn-wav
 - audio/x-wav
 - audio/x-adpcm
 - audio/ac3
 - audio/eac3
 - audio/vnd\.dts
 - audio/vnd\.dts\.hd
 - audio/vnd\.dolby\.heaac\.1
 - audio/vnd\.dolby\.heaac\.2
 - audio/vnd\.dolby\.mlp
 - audio/basic
 - audio/midi
 - audio/x-ape
 - audio/x-gsm
 - audio/x-musepack
 - audio/x-tta
 - audio/x-wavpack
 - audio/x-shorten
 - audio/x-it
 - audio/x-mod
 - audio/x-s3m
 - audio/x-xm



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.excelFormats



default applications for these MIME:
application/vnd\.ms-excel

 - application/vnd\.openxmlformats-officedocument\.spreadsheetml\.sheet
 - application/vnd\.openxmlformats-officedocument\.spreadsheetml\.template
 - application/vnd\.ms-excel\.sheet\.macroEnabled\.12
 - application/vnd\.ms-excel\.template\.macroEnabled\.12
 - application/vnd\.ms-excel\.addin\.macroEnabled\.12
 - application/vnd\.ms-excel\.sheet\.binary\.macroEnabled\.12



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.explorerFormats



default applications for these MIME:
inode/directory

 - x-scheme-handler/file



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.imageFormats



default applications for these MIME:
image/jpeg

 - image/bmp
 - image/gif
 - image/jpg
 - image/pjpeg
 - image/png
 - image/tiff
 - image/x-bmp
 - image/x-gray
 - image/x-icb
 - image/x-ico
 - image/x-png
 - image/x-portable-anymap
 - image/x-portable-bitmap
 - image/x-portable-graymap
 - image/x-portable-pixmap
 - image/x-xbitmap
 - image/x-xpixmap
 - image/x-pcx
 - image/x-icns
 - image/svg+xml
 - image/svg+xml-compressed
 - image/vnd\.wap\.wbmp
 - image/webp



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.mailFormats



default applications for these MIME:
x-scheme-handler/mailto



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.pptFormats



default applications for these MIME:
application/vnd\.ms-powerpoint

 - application/vnd\.openxmlformats-officedocument\.presentationml\.presentation
 - application/vnd\.openxmlformats-officedocument\.presentationml\.template
 - application/vnd\.openxmlformats-officedocument\.presentationml\.slideshow
 - application/vnd\.ms-powerpoint\.addin\.macroEnabled\.12
 - application/vnd\.ms-powerpoint\.presentation\.macroEnabled\.12
 - application/vnd\.ms-powerpoint\.template\.macroEnabled\.12
 - application/vnd\.ms-powerpoint\.slideshow\.macroEnabled\.12



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.videoFormats



default applications for these MIME:
video/x-ogm+ogg

 - video/ogg
 - video/x-ogm
 - video/x-theora+ogg
 - video/x-theora
 - video/x-ms-asf
 - video/x-ms-asf-plugin
 - video/x-ms-asx
 - video/x-ms-wm
 - video/x-ms-wmv
 - video/x-ms-wmx
 - video/x-ms-wvx
 - video/x-msvideo
 - video/divx
 - video/msvideo
 - video/vnd\.divx
 - video/avi
 - video/x-avi
 - video/vnd\.rn-realvideo
 - video/mp2t
 - video/mpeg
 - video/mpeg-system
 - video/x-mpeg
 - video/x-mpeg2
 - video/x-mpeg-system
 - video/mp4
 - video/mp4v-es
 - video/x-m4v
 - video/quicktime
 - video/x-matroska
 - video/webm
 - video/3gp
 - video/3gpp
 - video/3gpp2
 - video/vnd\.mpegurl
 - video/dv
 - video/x-anim
 - video/x-nsv
 - video/fli
 - video/flv
 - video/x-flc
 - video/x-fli
 - video/x-flv



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.webFormats



default applications for these MIME:
x-scheme-handler/http

 - x-scheme-handler/https
 - text/html
 - application/xhtml+xml
 - application/x-extension-htm
 - application/x-extension-html
 - application/x-extension-shtml
 - application/x-extension-xhtml
 - application/x-extension-xht



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)



## funkcia\.hm\.xdg\.mime\.defaultApplications\.wordFormats



default applications for these MIME:
application/msword

 - application/vnd\.openxmlformats-officedocument\.wordprocessingml\.document
 - application/vnd\.openxmlformats-officedocument\.wordprocessingml\.template
 - application/vnd\.ms-word\.document\.macroEnabled\.12
 - application/vnd\.ms-word\.template\.macroEnabled\.12



*Type:*
list of string



*Default:*

```nix
[ ]
```

*Declared by:*
 - [/home/modules/mime/defaultApplications\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/modules/mime/defaultApplications.nix)


# User Modules for linca
## funkcia\.hm\.gui\.v2rayn\.enable

Whether to enable v2rayn, a GUI for v2ray\.



*Type:*
boolean



*Default:*

```nix
true
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/linca/gui/v2rayn\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/gui/v2rayn.nix)



## linca\.play\.enable



Whether to enable packages for play\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/linca/modules/play\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/play.nix)



## linca\.sops\.enable



Whether to enable SOPS configs\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/linca/modules/sops\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/sops.nix)



## linca\.work\.enable



Whether to enable packages for work\.



*Type:*
boolean



*Default:*

```nix
false
```



*Example:*

```nix
true
```

*Declared by:*
 - [/home/linca/modules/work\.nix](https://github.com/Lhcfl/nixos-cfg/blob/main/home/linca/modules/work.nix)


