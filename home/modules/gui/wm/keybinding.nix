{ lib, ... }:
let
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

      step-type = enum [
        "Previous"
        "Next"
      ];

      unit-type = submodule { options = { }; };
    in
    {
      spawn = lib.mkOption {
        description = ''
          spawn command.
        '';
        type = listOf str;
      };
      spawn-sh = lib.mkOption {
        description = ''
          spawn command, with `sh -c`
        '';
        type = str;
      };
      focus-workspace = lib.mkOption {
        description = ''
          focus workspace by id
        '';
        type = workspace-type;
      };
      focus-window-relative = lib.mkOption {
        description = ''
          focus window by direction
        '';
        type = direction-type;
      };
      move-window-relative = lib.mkOption {
        description = ''
          move window by direction
        '';
        type = direction-type;
      };
      move-window-to-workspace = lib.mkOption {
        description = ''
          move window to workspace by id
        '';
        type = workspace-type;
      };
      move-workspace-relative = lib.mkOption {
        description = ''
          move workspace by direction
        '';
        type = workspace-type;
      };
      screenshot = lib.mkOption {
        description = ''
          take a screenshot
        '';
        type = unit-type;
      };
      close-window = lib.mkOption {
        description = ''
          close the focused window
        '';
        type = unit-type;
      };
      quit = lib.mkOption {
        description = ''
          quit shell
        '';
        type = unit-type;
      };
      maximize = lib.mkOption {
        description = ''
          maximize the window
        '';
        type = unit-type;
      };
      fullscreen = lib.mkOption {
        description = ''
          fullscreen the window
        '';
        type = unit-type;
      };
      resize-preset = lib.mkOption {
        description = ''
          resize the window
        '';
        type = unit-type;
      };
      show-help = lib.mkOption {
        description = ''
          show help of commands
        '';
        type = unit-type;
      };
      toggle-window-floating = lib.mkOption {
        description = ''
          toggle floating
        '';
        type = unit-type;
      };
      toggle-window-pinned = lib.mkOption {
        description = ''
          Pin the focused window above other windows
        '';
        type = unit-type;
      };
      toggle-column-tabbed = lib.mkOption {
        description = ''
          Tab the rows around the focused window, or stack its tabs
        '';
        type = unit-type;
      };
      focus-column-tab-relative = lib.mkOption {
        description = ''
          Focus the previous or next tab in the focused tab group
        '';
        type = step-type;
      };
      focus-workspace-relative = lib.mkOption {
        description = ''
          Switch to the previous or next workspace on this output
        '';
        type = step-type;
      };
      toggle-window-scratchpad = lib.mkOption {
        description = ''
          Move the focused window to or from a scratchpad
        '';
        type = unit-type;
      };
      toggle-scratchpad = lib.mkOption {
        description = ''
          Show or hide the selected scratchpad windows
        '';
        type = unit-type;
      };
    };
in
{
  options.funkcia.hm.gui.wm.keybinding = lib.mkOption {
    default = { };
    description = "binds <key> to actions";

    type = lib.types.attrsWith {
      placeholder = "key";

      elemType = lib.types.submodule {
        options = {
          actions = lib.mkOption {
            type = lib.types.attrTag actions;
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
      };
    };
  };
}
