# home manager umbriel module
{
  lib,
  pkgs,
  config,
  osConfig,
  ...
}:
let
  cfg = config.funkcia.hm.gui.umbriel;
  toml = pkgs.formats.toml { };
in
{
  options.funkcia.hm.gui.umbriel = {
    settings = lib.mkOption {
      default = { };
      type = toml.type;
      description = "lines of umbriel config parts";
    };
  };

  config = lib.mkIf osConfig.programs.umbriel.enable {
    xdg.configFile."umbriel/config.toml".source = toml.generate "umbriel-config" cfg.settings;
    services.polkit-gnome.enable = true;
  };
}
