{
  lib,
  config,
  ...
}:
{
  funkcia.hm.gui.wm-keybinding.umbriel.enable = config.funkcia.hm.gui.enable;

  funkcia.hm.gui.umbriel.settings = lib.mkIf config.funkcia.hm.gui.enable {
    general.autostart = [
      "v2rayN"
    ];

    environment.QT_QPA_PLATFORM = "wayland";

    input.touchpad = {
      tap = true;
      natural_scroll = true;
      disable_while_typing = true;
    };

    input.focus = {
      follows_mouse = true;
      follows_mouse_max_scroll = 0.5;
    };

    window_rule = [
      { blur = true; }
      {
        match.is_floating = true;
        blur_optimized = false;
      }
    ];

    hot_corners.top_left = {
      enabled = true;
      delay_ms = 500;
      action = "overview-open";
    };
  };
}
