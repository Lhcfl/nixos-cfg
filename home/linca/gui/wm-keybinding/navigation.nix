{ config, lib, ... }:
let
  inherit (config.funkcia.hm.gui.wm-keybinding.utils) mkModBind;
in
{
  funkcia.hm.gui.wm-keybinding.binds = lib.flatten [
    (lib.pipe 9 [
      (builtins.genList (x: x + 1))
      (map (id: [
        (mkModBind [ id ] "focus-workspace" id)
        (mkModBind [ "Shift" id ] "move-window-to-workspace" id)
      ]))
    ])
    (map
      (dir: [
        (mkModBind [ dir ] "focus-window-relative" dir)
        (mkModBind [ "Shift" dir ] "move-window-relative" dir)
      ])
      [
        "Left"
        "Right"
        "Up"
        "Down"
      ]
    )
  ];
}
