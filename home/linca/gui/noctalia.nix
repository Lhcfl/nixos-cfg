{
  inputs,
  osConfig,
  lib,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  config = lib.mkIf osConfig.programs.noctalia.enable {
    funkcia.hm.gui.wms.niri.settings =
      with kdl.extras.niri;
      kdl.formats.v1 [
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
  };
}
