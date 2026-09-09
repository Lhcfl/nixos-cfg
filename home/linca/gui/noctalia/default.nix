{
  inputs,
  lib,
  funkcia-utils,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  funkcia.hm.gui.niri.settings =
    with kdl.extras.niri;
    kdl.formats.v1 [
      (spawn-at-startup "noctalia")

      (layer-rule [
        (match { namespace = "^noctalia.*(panel).*"; })
        (match { namespace = "vicinae"; })
        (background-effect [
          (xray false)
        ])
      ])

      (layer-rule [
        (match { namespace = "noctalia-wallpaper"; })
        (place-within-backdrop true)
      ])
    ];

  funkcia.hm.gui.noctalia = {
    enable = true;

    settings = {
      idle = {
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 600;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 900;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 660;
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
          ];
        };
      };

      shell = {
        avatar_path = funkcia-utils.projectPath /home/linca/assets/avatar-trans.png;
        lang = "zh-Hans";
        panel = {
          control_center_placement = "floating";
          open_near_click_control_center = true;
          transparency_mode = "soft";
        };
        screenshot = {
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

  funkcia.hm.gui.wm-keybinding.binds = {
    "XF86MonBrightnessUp".allow-when-locked = true;
    "XF86MonBrightnessUp".actions.spawn-sh = "noctalia msg brightness-up";

    "XF86MonBrightnessDown".allow-when-locked = true;
    "XF86MonBrightnessDown".actions.spawn-sh = "noctalia msg brightness-down";

    "Ctrl+Alt+A".title = "Take Screenshot";
    "Ctrl+Alt+A".actions.spawn-sh = "noctalia msg screenshot-region";
  };
}
