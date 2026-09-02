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
  funkcia.hm.gui.wms.niri.settings =
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
}
