# GNOME Keyring configuration for NixOS
# 这个模块是为了在 *不使用* GNOME 的情况下启用 Keyring 及其相关服务。
# 如果使用 GNOME 桌面环境，则不需要此模块
# 最初目的是为了在 Hyprland 上使用 Keyring

{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.modules.gnome-keyring = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable GNOME Keyring module.
        It's for using GNOME Keyring in non-GNOME desktop environments.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.gnome-keyring.enable {
    environment.systemPackages = with pkgs; [
      gnome-keyring
      libsecret
    ];

    services.gnome.gnome-keyring.enable = true;
    # disable gcr-ssh-agent because it can conflict with other ssh agents
    services.gnome.gcr-ssh-agent.enable = false;
    # security.pam.services.<yourDisplayManager>.enableGnomeKeyring = true;
  };
}
