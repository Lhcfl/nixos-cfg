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
      hot_corners.top_left = {
        enabled = true;
        delay_ms = 500;
        action = "overview-open";
      };

      general = {
        xwayland = true;
        xwayland_native_resolution = true;
      };
    };
  };
}
