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

    bars = lib.mkOption {
      type = lib.types.attrsOf (
        lib.types.submodule {
          options =
            let
              colType = lib.types.listOf widgetType;

              widgetType = lib.types.submodule {
                freeformType = lib.types.attrsOf lib.types.anything;
                options.type = lib.mkOption { type = lib.types.str; };
              };
            in
            {
              start = lib.mkOption { type = colType; };
              center = lib.mkOption { type = colType; };
              end = lib.mkOption { type = colType; };
              settings = lib.mkOption { type = toml.type; };
            };
        }
      );
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

    funkcia.hm.gui.noctalia.settings =
      let
        handle =
          { name, value }:
          let
            collectWidgets' =
              path: arr:
              let
                withId = lib.imap0 (
                  idx:
                  data@{ type, ... }:
                  {
                    idx = idx;
                    id =
                      if type == "group" then
                        "group:${path}-g${toString idx}"
                      else
                        "${name}-${path}-${toString idx}--${type}";
                    data = data;
                  }
                ) arr;

                widgets = builtins.filter ({ data, ... }: data.type != "group") withId;
                groups = builtins.filter ({ data, ... }: data.type == "group") withId;

                mkWidgets =
                  src:
                  lib.pipe src [
                    (map (
                      { id, data, ... }: {
                        name = id;
                        value = data;
                      }
                    ))
                    lib.listToAttrs
                  ];

                mkGroup =
                  {
                    idx,
                    data,
                    ...
                  }:
                  let
                    inherit (collectWidgets' "${path}-g${toString idx}" data.members) widgets results;
                  in
                  {
                    widgets = widgets;
                    data = (removeAttrs data [ "type" ]) // {
                      id = "${path}-g${toString idx}";
                      members = results;
                    };
                  };

                collected = map mkGroup groups;
              in
              {
                widgets = lib.foldl (x: y: x // y) (mkWidgets widgets) (map (x: x.widgets) collected);
                groups = map (x: x.data) collected;
                results = map (x: x.id) withId;
              };

            collectWidgets =
              path:
              let
                inherit (collectWidgets' path value.${path}) widgets results groups;
              in
              {
                widget = widgets;
                bar.${name} = {
                  capsule_group = groups;
                  ${path} = results;
                };
              };

          in
          lib.mkMerge [
            (collectWidgets "start")
            (collectWidgets "center")
            (collectWidgets "end")
            { bar.${name} = value.settings; }
          ];
      in
      lib.pipe config.funkcia.hm.gui.noctalia.bars [
        lib.attrsToList
        (map handle)
        lib.mkMerge
      ];
  };
}
