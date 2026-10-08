{
  lib,
  config,
  ...
}:
{
  funkcia.hm.gui.wm.umbriel.enable = config.funkcia.hm.gui.enable;

  funkcia.hm.gui.umbriel.settings = lib.mkIf config.funkcia.hm.gui.enable {
    input.touchpad = {
      tap = true;
      natural_scroll = true;
      disable_while_typing = true;
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

    layout.struts.top = -3;

    general = {
      xwayland = true;
      xwayland_native_resolution = true;
    };
  };
}
