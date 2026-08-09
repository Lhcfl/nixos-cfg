{
  config,
  lib,
  ...
}:
{
  options.funkcia.os.gui.hyprland = {
    enable = lib.mkEnableOption ''
      Hyprland and related settings.
    '';
  };

  config = lib.mkIf config.funkcia.os.gui.hyprland.enable {
    programs.hyprland.enable = true;
    funkcia.os.gnome-keyring.enable = lib.mkDefault true;
    security.pam.services.hyprland = {
      enableGnomeKeyring = lib.mkIf config.funkcia.os.gnome-keyring.enable true;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
