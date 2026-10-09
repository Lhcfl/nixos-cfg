{ lib, ... }:
{
  funkcia.hm.gui.wm.keybinding = {
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

    "Mod+P".actions."toggle-window-pinned" = { };
    "Mod+T".actions."toggle-column-tabbed" = { };
    "Mod+bracketright".actions."focus-column-tab-relative" = "Next";
    "Mod+bracketleft".actions."focus-column-tab-relative" = "Previous";
    "Mod+Shift+Space".actions."toggle-window-scratchpad" = { };
    "Mod+Space".actions."toggle-scratchpad" = { };
    "Mod+WheelUp".actions."focus-workspace-relative" = "Previous";
    "Mod+WheelDown".actions."focus-workspace-relative" = "Next";
  };
}
