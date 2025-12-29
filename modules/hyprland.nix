{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    # desktop
    hyprland.enable = true;
    waybar.enable = true;

    # use default ssh agent
    ssh.startAgent = true;
  };

  security.pam.services.hyprland = {
    enableGnomeKeyring = lib.mkIf config.funkcia.modules.gnome-keyring.enable true;
  };
}
