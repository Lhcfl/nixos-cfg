{
  lib,
  ...
}:
{
  options.funkcia.hm.gui.wm = {
    niri.enable = lib.mkEnableOption "统一的 WM 设置 for Niri";
    umbriel.enable = lib.mkEnableOption "统一的 WM 设置 for umbriel";

    spawn-at-startup = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [ "fcitx5" ];
      description = "Shell commands to run when the WM session starts.";
    };

    input = {
      follow-mouse = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Focus the window under the mouse pointer.";
      };

      follow-mouse-max-scroll = lib.mkOption {
        type = lib.types.float;
        default = 0.5;
        description = ''
          Refuse focus-follows-mouse when focusing would scroll the view
          farther than this many viewport widths.
        '';
      };
    };

    environment = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      description = "Environment variables to set for the WM session.";
    };
  };
}
