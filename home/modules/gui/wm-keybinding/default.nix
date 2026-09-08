{
  config,
  lib,
  ...
}:
let
  cfg = config.funkcia.hm.gui.wm-keybinding;

  actions =
    with lib.types;
    let
      workspace-type = oneOf [
        str
        int
      ];

      direction-type = enum [
        "Left"
        "Right"
        "Up"
        "Down"
      ];
    in
    {
      spawn = listOf str;
      spawn-sh = str;
      focus-workspace = workspace-type;
      focus-window-relative = direction-type;
      move-window-relative = direction-type;
      move-window-to-workspace = workspace-type;
    };

in
{
  options.funkcia.hm.gui.wm-keybinding = {
    niri.enable = lib.mkEnableOption "keybinding for Niri";

    utils = lib.mkOption {
      type = lib.types.anything;
    };

    binds = lib.mkOption {
      default = { };
      type = lib.types.attrsOf (
        lib.types.submodule {
          options.actions = lib.mapAttrs (
            name: value:
            lib.mkOption {
              type = lib.types.nullOr value;
            }
          ) actions;
          options.allow-when-locked = lib.mkEnableOption "when locked";
        }
      );
      description = "binds <key> to actions";
    };
  };

  config.funkcia.hm.gui.wm-keybinding.utils = {
    converted = lib.pipe cfg.binds [
      lib.attrsToList
      (map (
        { name, value }:
        value
        // {
          bind = name;
          actions = lib.pipe value.actions [
            lib.attrsToList
            (builtins.filter (x: x.value != null))
          ];
        }
      ))
    ];
  };
}
