{
  inputs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  programs.vicinae = {
    enable = true;
  };

  funkcia.hm.gui.wms.niri.settings =
    with kdl.extras.niri;
    kdl.formats.v1 [
      (spawn-at-startup "vicinae" "server")

      (layer-rule [
        (match { namespace = "vicinae"; })
        (background-effect [
          (xray false)
        ])
      ])
    ];
}
