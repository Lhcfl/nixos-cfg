{ config, ... }:
{
  funkcia.hm.gui.wm-keybinding.binds = {
    "Ctrl+Alt+T".actions.spawn = [ "kitty " ];
    "Ctrl+Alt+A".actions.spawn-sh = "noctalia msg screenshot-region";
    "Mod+B".actions.spawn = [ "zen" ];
  };
}
