{ config, ... }:
let
  inherit (config.funkcia.hm.gui.wm-keybinding.utils) mkBind mkModBind;
in
{
  funkcia.hm.gui.wm-keybinding = {
    niri.enable = true;

    binds = [
      (mkBind [ "Ctrl" "Alt" "T" ] "spawn" [ "kitty" ])
      (mkBind [ "Ctrl" "Alt" "A" ] "spawn-sh" "noctalia msg screenshot-region")
    ];
  };
}
