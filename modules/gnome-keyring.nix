# GNOME Keyring configuration for NixOS
# 这个模块是为了在 *不使用* GNOME 的情况下启用 Keyring 及其相关服务。
# 如果使用 GNOME 桌面环境，则不需要此模块
# 最初目的是为了在 Hyprland 上使用 Keyring

{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-keyring
    libsecret
  ];

  services.gnome.gnome-keyring.enable = true;

  # disable gcr-ssh-agent because it can conflict with other ssh agents
  services.gnome.gcr-ssh-agent.enable = false;

  # security.pam.services.<yourDisplayManager>.enableGnomeKeyring = true;
}
