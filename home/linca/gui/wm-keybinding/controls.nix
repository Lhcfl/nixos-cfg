{ lib, ... }:
{
  funkcia.hm.gui.wm-keybinding.binds = {
    "Print".actions.screenshot = { };
    "Ctrl+Alt+A".actions = lib.mkDefault { screenshot = { }; };
    "Mod+Q".actions.close-window = { };
    "Alt+F4".actions.close-window = { };
    "Mod+Delete".actions.quit = { };
    "Shift+F11".actions.fullscreen = { };
    "Mod+M".actions.maximize = { };
    "Mod+R".actions.resize-preset = { };
    "Mod+L".actions.spawn = [
      "loginctl"
      "lock-session"
    ];
    "Mod+Slash".actions.show-help = { };
    "Mod+Shift+F".actions.toggle-window-floating = { };
  };
}
