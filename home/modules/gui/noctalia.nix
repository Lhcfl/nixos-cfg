# home manager noctalia module
{
  inputs,
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.hm.gui.noctalia;
  toml = pkgs.formats.toml { };
  kdl = inputs.nix-kdl.kdl;
in
{
  options.funkcia.hm.gui.noctalia = {
    enable = lib.mkEnableOption "Noctalia shell" // {
      default = osConfig.programs.noctalia.enable or false;
      defaultText = lib.literalExpression "osConfig.programs.noctalia.enable or false";
      description = "Whether to manage the Noctalia config.";
    };

    settings = lib.mkOption {
      type = toml.type;
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
    funkcia.hm.gui.wms.niri.settings = lib.mkMerge [
      (
        with kdl.extras.niri;
        kdl.formats.v1 [
          (spawn-at-startup "noctalia")

          (layer-rule [
            (match { namespace = "^noctalia.*(panel).*"; })
            (background-effect [
              (xray false)
            ])
          ])

          (layer-rule [
            (match { namespace = "noctalia-wallpaper"; })
            (place-within-backdrop true)
          ])
        ]
      )
      (lib.mkAfter ''
        include optional=true "noctalia.kdl"
      '')
    ];

    home.packages = lib.mkIf (osConfig.programs.noctalia.enable or false) [
      pkgs.noctalia
    ];

    xdg.configFile = lib.mkIf (cfg.settings != { }) {
      "noctalia/config.toml".source = toml.generate "noctalia-config.toml" cfg.settings;
    };
  };
}
