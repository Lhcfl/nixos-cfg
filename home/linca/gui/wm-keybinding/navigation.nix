{ lib, ... }:
{
  funkcia.hm.gui.wm-keybinding.binds = lib.mkMerge (
    lib.concatLists [
      (map (id: {
        "Mod+${toString id}".actions.focus-workspace = id;
        "Shift+Mod+${toString id}".actions.move-window-to-workspace = id;
      }) (builtins.genList (x: x + 1) 9))
      (map
        (dir: {
          "Mod+${dir}".actions.focus-window-relative = dir;
          "Mod+Shift+${dir}".actions.move-window-relative = dir;
        })
        [
          "Left"
          "Right"
          "Up"
          "Down"
        ]
      )
    ]
  );
}
