# home manager noctalia module
{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.gui.noctalia;
  toml = pkgs.formats.toml { };
in
{
  options.funkcia.hm.gui.noctalia = {
    enable = lib.mkEnableOption "Noctalia shell" // {
      default = osConfig.programs.noctalia.enable or false;
      defaultText = lib.literalExpression "osConfig.programs.noctalia.enable or false";
      description = "Whether to manage the Noctalia config.";
    };

    settings = lib.mkOption {
      inherit (toml) type;
      default = { };
      example = {
        theme.mode = "dark";
        bar.default.position = "top";
      };
      description = ''
        Structured config written to `~/.config/noctalia/config.toml` via
        `pkgs.formats.toml` (nested attrsets become TOML tables and lists of
        attrsets become arrays of tables).

        Noctalia reads every `*.toml` directly in that folder (sorted
        alphabetically) and merges them; GUI-side overrides are kept separately
        in the app-managed `~/.local/state/noctalia/settings.toml`, which is
        loaded last and wins.

        See https://docs.noctalia.dev/noctalia/configuration/ for the schema.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    tessera.settings.general.autostart = [ "noctalia" ];

    tessera.settings.layer-rule = {
      noctalia-panel = {
        match.namespace = "^noctalia.*(panel).*";
        background_effect.xray = false;
      };

      noctalia-wallpaper = {
        match.namespace = "noctalia-wallpaper";
        place_within_backdrop = true;
      };
    };

    tessera.niri.includes = [
      {
        optional = true;
        source = "noctalia.kdl";
      }
    ];

    tessera.umbriel.includes = [
      {
        optional = true;
        source = "noctalia.toml";
      }
    ];

    home.packages = lib.mkIf (osConfig.programs.noctalia.enable or false) [
      pkgs.noctalia
    ];

    xdg.configFile = lib.mkIf (cfg.settings != { }) {
      "noctalia/config.toml".source = toml.generate "noctalia-config.toml" cfg.settings;
    };
  };
}
