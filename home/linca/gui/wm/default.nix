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
        appearance = {
          prefer_no_csd = true;
          border_width = 2;

          blur = {
            passes = 3;
            offset = 3.0;
            noise = 0.02;
            saturation = 1.5;
          };
        };

        colors.border.unfocused = "#595959aa";

        screenshot.path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

        input = {
          follow-mouse = true;
          follow-mouse-max-scroll = 0.5;

          cursor = {
            size = 24;
            hide_when_typing = true;
          };

          touchpad = {
            tap = true;
            natural_scroll = true;
            disable_while_typing = true;
          };
        };

        hotkey_overlay = {
          hide_not_bound = true;
          skip_at_startup = true;
        };

        overview.workspace_shadow = false;

        environment.QT_QPA_PLATFORM = "wayland";

        layout = {
          preset-column-widths = [
            0.33
            0.49
            0.65
            0.98
          ];

          gap = 3;
          struts.top = -4;
          background_color = "transparent";

          scrolling = {
            center_focused = "never";
            default_extent_fraction = 0.49;
          };

          focus_ring.off = true;

          border.active_gradient = {
            from = "#ddaa77ee";
            to = "#eebb99ee";
            angle = 45;
            relative_to = "workspace-view";
          };
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
            default_scrolling_extent_px = 480;
            default_window_height.fixed = 270;
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
