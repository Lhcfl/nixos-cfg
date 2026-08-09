{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.os.sddm;

  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = cfg.theme.name;
    themeConfig = cfg.theme.config;
  };
in
{
  options.funkcia.os.sddm = {
    enable = lib.mkEnableOption "sddm module, which is a GUI login manager (or display manager).";
    theme.name = lib.mkOption {
      type = lib.types.str;
      default = "hyprland_kath";
      description = "theme name of sddm-astronaut-theme. see https://github.com/Keyitdev/sddm-astronaut-theme/tree/master/Themes";
    };
    theme.config = lib.mkOption {
      type = lib.types.json;
      description = "theme config of the theme.";
      default = { };
      example = {
        # Customize colors and settings
        HeaderTextColor = "#d5c4a1";
        Background = "Backgrounds/your-custom-background.png";
        # ... other theme configuration options
      };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ sddm-astronaut ];

    services.displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
      extraPackages = [
        sddm-astronaut
        pkgs.kdePackages.qtmultimedia # Required for video backgrounds/audio
      ];
      theme = "sddm-astronaut-theme";
    };
  };
}
