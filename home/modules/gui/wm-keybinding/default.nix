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

      unit-type = submodule { options = { }; };
    in
    {
      spawn = {
        description = ''
          spawn command.
        '';
        type = listOf str;
      };
      spawn-sh = {
        description = ''
          spawn command, with `sh -c`
        '';
        type = str;
      };
      focus-workspace = {
        description = ''
          focus workspace by id
        '';
        type = workspace-type;
      };
      focus-window-relative = {
        description = ''
          focus window by direction
        '';
        type = direction-type;
      };
      move-window-relative = {
        description = ''
          move window by direction
        '';
        type = direction-type;
      };
      move-window-to-workspace = {
        description = ''
          move window to workspace by id
        '';
        type = workspace-type;
      };
      screenshot = {
        description = ''
          take a screenshot
        '';
        type = unit-type;
      };
      close-window = {
        description = ''
          close the focused window
        '';
        type = unit-type;
      };
      quit = {
        description = ''
          quit shell
        '';
        type = unit-type;
      };
      maximize = {
        description = ''
          maximize the window
        '';
        type = unit-type;
      };
      fullscreen = {
        description = ''
          fullscreen the window
        '';
        type = unit-type;
      };
      resize-preset = {
        description = ''
          resize the window
        '';
        type = unit-type;
      };
      show-help = {
        description = ''
          show help of commands
        '';
        type = unit-type;
      };
      toggle-window-floating = {
        description = ''
          toggle floating
        '';
        type = unit-type;
      };
    };

  bind-type = {
    actions = lib.mkOption {
      type = lib.types.attrTag (lib.mapAttrs (_: lib.mkOption) actions);
      description = ''
        The action binds to <key>. You can only select one action.
      '';
    };

    allow-when-locked = lib.mkEnableOption "when locked";

    title = lib.mkOption {
      default = null;
      type = lib.types.nullOr lib.types.str;
      description = "help menu title";
    };
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
      type = lib.types.attrsWith {
        elemType = lib.types.submodule {
          options = bind-type;
        };
        placeholder = "key";
      };
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
