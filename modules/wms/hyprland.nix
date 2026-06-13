{
  config,
  lib,
  ...
}:
{
  options.funkcia.modules.wms.hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable Hyprland module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.wms.hyprland.enable {
    programs = {
      # desktop
      hyprland.enable = true;
      # hyprland.withUWSM = true;
      # waybar.enable = true;
    };

    funkcia.modules.gnome-keyring.enable = lib.mkDefault true;

    environment.pathsToLink = [
      "/share/hypr"
    ];

    security.pam.services.hyprland = {
      enableGnomeKeyring = lib.mkIf config.funkcia.modules.gnome-keyring.enable true;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
