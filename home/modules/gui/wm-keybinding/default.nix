{
  lib,
  ...
}:
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
    in
    {
      spawn = listOf str;
      spawn-sh = str;
      focus-workspace = workspace-type;
      focus-window-relative = direction-type;
      move-window-relative = direction-type;
      move-window-to-workspace = workspace-type;
    };

  match = str: defs: if defs ? ${str} then defs.${str} else defs.default;

  keybinding-type = lib.types.addCheck (lib.types.submodule {
    options.bind = lib.mkOption {
      type = lib.types.listOf lib.types.str;
    };
    options.action = lib.mkOption {
      type = lib.types.enum (builtins.attrNames actions);
    };
    options.arguments = lib.mkOption {
      type = lib.types.anything;
    };
    options.allow-when-locked = lib.mkEnableOption "when locked";
  }) (x: (match x.action actions).check x);

in
{
  options.funkcia.hm.gui.wm-keybinding = {
    niri.enable = lib.mkEnableOption "keybinding for Niri";

    utils = lib.mkOption {
      type = lib.types.raw;
    };

    binds = lib.mkOption {
      default = [ ];
      type = lib.types.listOf keybinding-type;
      description = "lines of niri config parts";
    };
  };

  config.funkcia.hm.gui.wm-keybinding.utils = rec {
    mkBind = bind: action: arguments: {
      inherit action arguments;
      bind = map toString bind;
    };
    mkModBind = bind: mkBind ([ "Mod" ] ++ bind);
  };
}
