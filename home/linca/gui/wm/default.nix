{
  lib,
  config,
  osConfig,
  ...
}:
let
  cfg = config.funkcia.hm.gui;
  niriEnabled = cfg.enable && (osConfig.programs.niri.enable or false);
  umbrielEnabled = cfg.enable && (osConfig.programs.umbriel.enable or false);
in
{
  config = lib.mkMerge [
    (lib.mkIf cfg.enable {
      tessera.settings = {
        input = {
          follow-mouse = true;
          follow-mouse-max-scroll = 0.5;
        };
        environment.QT_QPA_PLATFORM = "wayland";
        layout = {
          preset-column-widths = [
            0.33
            0.49
            0.65
            0.98
          ];
        };

        window-rule = {
          default-window = {
            blur = true;
            corner_radius = 10;
            clip_to_geometry = true;
            draw_border_with_background = false;
          };

          default-floating = {
            match.is_floating = true;
            blur_optimized = false;
          };

          pip = {
            match.title = "^(Picture-in-Picture|Picture in picture)$";
            default_floating = true;
            default_maximize = false;
            default_position = {
              x = 20;
              y = 20;
              anchor = "bottom_right";
            };
          };

          alone-maximize = {
            match.is_alone = true;
            default_maximize = true;
          };
        };
      };
    })

    # niri / umbriel 自身都不监听热插拔，由 udiskie 负责自动挂载。
    (lib.mkIf (niriEnabled || umbrielEnabled) {
      services.udiskie = {
        enable = true;
        # 有 StatusNotifier 托盘就显示图标，否则静默。
        tray = "auto";
        notify = true;
      };
    })
  ];
}
