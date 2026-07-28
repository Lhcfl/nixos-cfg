{
  config,
  lib,
  ...
}:
{
  options.funkcia.os.gui.hyprland = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable Hyprland module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.os.gui.hyprland.enable {
    programs = {
      # desktop
      hyprland.enable = true;
      # hyprland.withUWSM = true;
      # waybar.enable = true;
    };

    funkcia.os.gnome-keyring.enable = lib.mkDefault true;

    # hyprland lua 会暴露出其 类型注释等
    environment.pathsToLink = [
      "/share/hypr"
    ];

    security.pam.services.hyprland = {
      enableGnomeKeyring = lib.mkIf config.funkcia.os.gnome-keyring.enable true;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
