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
      {
        match.title = "^(Picture-in-Picture|Picture in picture)$";
        default_floating = true;
        default_maximize = false;
        default_position = {
          x = 20;
          y = 20;
          anchor = "bottom_right";
        };
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

    layout.scrolling = {
      default_extent_fraction = 0.5;
    };
  };
}
