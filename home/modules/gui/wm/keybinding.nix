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
    (lib.mapAttrs (
      _:
      attrs@{ type, ... }:
      lib.mkOption (
        attrs
        // {
          type = (either type (functionTo type)) // {
            description = "X, or a function that takes the context and returns X, where X = ${type.description}";
          };
        }
      )
    ))
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
        move-workspace-relative = {
          description = ''
            move workspace by direction
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
        toggle-window-pinned = {
          description = ''
            Pin the focused window above other windows
          '';
          type = unit-type;
        };
        toggle-column-tabbed = {
          description = ''
            Tab the rows around the focused window, or stack its tabs
          '';
          type = unit-type;
        };
        focus-column-tab-relative = {
          description = ''
            Focus the previous or next tab in the focused tab group
          '';
          type = step-type;
        };
        focus-workspace-relative = {
          description = ''
            Switch to the previous or next workspace on this output
          '';
          type = step-type;
        };
        toggle-window-scratchpad = {
          description = ''
            Move the focused window to or from a scratchpad
          '';
          type = unit-type;
        };
        toggle-scratchpad = {
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
