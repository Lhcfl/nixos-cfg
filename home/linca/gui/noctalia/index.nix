{
  inputs,
  lib,
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

      (layer-rule [
        (match { namespace = "noctalia-bar-Linca"; })
        (match { namespace = "noctalia-bar-top-bar"; })
        (background-effect [
          (blur false)
        ])
      ])
    ];

  funkcia.hm.gui.noctalia = {
    enable = true;

    settings = {
      # shell = {
      #   avatar_path = "/home/linca/.face";
      #   lang = "zh-Hans";
      #   panel = {
      #     control_center_placement = "floating";
      #     open_near_click_control_center = true;
      #     transparency_mode = "soft";
      #   };
      #   screenshot = {
      #     directory = "~/Pictures/Screenshots";
      #   };
      #   settings_show_advanced = true;
      # };
    };
  };
}
