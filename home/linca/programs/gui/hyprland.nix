{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.hm.gui.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable Hyprland and related services.";
  };

  config = lib.mkIf config.funkcia.hm.gui.hyprland.enable {
    home = {
      pointerCursor = {
        hyprcursor.enable = true;
        size = 24;
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
      };

      packages = with pkgs; [
        hyprcursor
      ];
    };
  };
}
