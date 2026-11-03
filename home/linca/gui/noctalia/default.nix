{
  lib,
  config,
  funkcia-utils,
  osConfig,
  ...
}:
let
  namespace = "^noctalia-(notification|dock|panel|attached-panel|osd)$";
in
{
  tessera.settings.layer-rule.noctalia-surface = {
    match = { inherit namespace; };
    blur = true;
    # blur_ignore_alpha = 0.6 avoids blurring highly transparent parts of a surface.
    blur_ignore_alpha = 0.6;
    blur_optimized = false;
  };

  funkcia.hm.gui.noctalia = {
    enable = config.funkcia.hm.gui.enable;

    settings = {
      idle = {
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = osConfig.funkcia.os.presets.laptop.enable; # 笔记本电脑才 lock and suspend; 台式机只锁屏
            timeout = 900;
          };
        };

        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
      };

      theme = {
        source = "wallpaper";
        templates = {
          builtin_ids = [
            "niri"
            "umbriel"
            "kitty"
            "alacritty"
          ];

          community_ids = [
            "zed"
            "vicinae"
          ];
        };
      };

      shell = {
        avatar_path = funkcia-utils.projectPath /home/linca/assets/avatar-trans.png;
        polkit_agent = true;
        lang = "zh-Hans";
        panel = {
          control_center_placement = "floating";
          open_near_click_control_center = true;
          transparency_mode = "soft";
        };
        screenshot = {
          annotate = true;
          directory = "~/Pictures/Screenshots";
        };
        settings_show_advanced = true;
      };

      hooks = {
        theme_mode_changed = ''
          dconf write /org/gnome/desktop/interface/color-scheme "\"prefer-$NOCTALIA_THEME_MODE\"";
        '';
      };
    };
  };

  tessera.settings.keybinds = lib.mkIf config.funkcia.hm.gui.noctalia.enable {
    "XF86MonBrightnessUp".allow-when-locked = true;
    "XF86MonBrightnessUp".actions.spawn = "noctalia msg brightness-up";

    "XF86MonBrightnessDown".allow-when-locked = true;
    "XF86MonBrightnessDown".actions.spawn = "noctalia msg brightness-down";

    "Ctrl+Alt+A".title = "Take Screenshot";
    "Ctrl+Alt+A".actions.spawn = "noctalia msg screenshot-region";
  };

  programs.alacritty.settings.general.import = [ "themes/noctalia.toml" ];
}
