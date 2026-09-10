{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:
{
  funkcia.hm.gui.wm-keybinding.umbriel.enable = config.funkcia.hm.gui.enable;

  funkcia.hm.gui.umbriel.settings = lib.mkIf config.funkcia.hm.gui.enable {
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
