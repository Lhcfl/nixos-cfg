{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.os.gnome-keyring.enable = lib.mkEnableOption ''
    GNOME Keyring module.

    在不使用GNOME 的情况下，为了让各种软件安全的存储机密，需要用到
    Secret Service。此模块将 gnome-keyring 用在任何桌面环境中。

    see <https://wiki.nixos.org/wiki/Secret_Service>
  '';

  config = lib.mkIf config.funkcia.os.gnome-keyring.enable {
    environment.systemPackages = with pkgs; [
      gnome-keyring
      libsecret
    ];

    services.gnome.gnome-keyring.enable = true;
    # disable gcr-ssh-agent because it can conflict with other ssh agents
    services.gnome.gcr-ssh-agent.enable = false;

    security.pam.services.login.enableGnomeKeyring = true;
  };
}
