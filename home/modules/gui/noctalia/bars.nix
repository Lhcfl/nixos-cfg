{
  this,
  config,
  lib,
  pkgs,
  ...
}:
let
  toml = pkgs.formats.toml { };

  widgetType = lib.types.submodule {
    freeformType = lib.types.attrsOf toml.type;
    options.type = lib.mkOption {
      type = lib.types.str;
      description = ''
        widget 的类型，例如 `launcher`, `tray` 等
      '';
    };
  };

  barColumnType =
    let
      t = lib.types.listOf widgetType;
    in
    t
    // {
      description = "list of noctalia widgets (a.k.a. ${t.description})";
    };

  barType = lib.types.submodule {
    options = {
      start = lib.mkOption {
        type = barColumnType;
        description = ''
          bar 前段的组件
        '';
      };
      center = lib.mkOption {
        type = barColumnType;
        description = ''
          bar 中间段的组件
        '';
      };
      end = lib.mkOption {
        type = barColumnType;
        description = ''
          bar 末尾段的组件
        '';
      };
      settings = lib.mkOption {
        inherit (toml) type;
        description = ''
          bar 的设置
        '';
      };
    };
  };

in
{
  this.options = lib.mkOption {
    default = { };
    type = lib.types.attrsOf barType;
    description = ''
      声明式的 noctalia bar
    '';
  };

  config.funkcia.hm.gui.noctalia.settings = lib.mkMerge (
    lib.flip lib.mapAttrsToList this.config (
      name: value:
      let
        collectWidgets' =
          path: arr:
          let
            withId = lib.imap0 (
              idx:
              data@{ type, ... }:
              {
                inherit idx;
                id =
                  if type == "group" then
                    "group:${path}-g${toString idx}"
                  else
                    "${name}-${path}-${toString idx}--${type}";
                inherit data;
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
                inherit widgets;
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
      ]
    )
  );
}
