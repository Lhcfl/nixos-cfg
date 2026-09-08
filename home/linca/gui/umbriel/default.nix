{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  funkcia.hm.gui.wm-keybinding.umbriel.enable = true;

  funkcia.hm.gui.umbriel.settings = {
    general.autostart = [
      "noctalia"
      "v2rayN"
    ];

    environment.QT_QPA_PLATFORM = "wayland";

    input.touchpad = {
      tap = true;
      natural_scroll = true;
      disable_while_typing = true;
    };

    window_rule = [
      { blur = true; }
    ];
  };
}
