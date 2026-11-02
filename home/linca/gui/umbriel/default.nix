{
  lib,
  config,
  osConfig,
  ...
}:
{
  config = lib.mkIf (config.funkcia.hm.gui.enable && (osConfig.programs.umbriel.enable or false)) {
    tessera.umbriel.enable = true;

    tessera.umbriel.includes = [
      {
        optional = true;
        source = "customize.toml";
      }
    ];

    tessera.umbriel.settings = {
      input.touchpad = {
        tap = true;
        natural_scroll = true;
        disable_while_typing = true;
      };

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

      appearance = {
        prefer_no_csd = true;
      };
    };
  };
}
