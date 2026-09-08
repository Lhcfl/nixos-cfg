{ ... }:
{
  funkcia.hm.gui.wm-keybinding.binds = {
    "Ctrl+Alt+T".actions.spawn = [ "kitty" ];

    "Mod+B".actions.spawn = [ "zen" ];

    "Mod+S".actions.spawn-sh = "kitty nu";

    "Mod+E" = {
      title = "Open Home Folder";
      actions.spawn-sh = "xdg-open ~";
    };

    "Mod+F" = {
      title = "Open Launcher";
      actions.spawn = [
        "vicinae"
        "toggle"
      ];
    };
  };
}
