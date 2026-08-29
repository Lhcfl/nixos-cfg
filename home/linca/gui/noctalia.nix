{
  inputs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  funkcia.hm.gui.noctalia = {
    enable = true;
  };

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

}
