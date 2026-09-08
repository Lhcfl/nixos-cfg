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
    systemd.enable = true;
  };

  funkcia.hm.gui.niri.settings =
    with kdl.extras.niri;
    kdl.formats.v1 [
      (layer-rule [
        (match { namespace = "vicinae"; })
        (background-effect [
          (xray false)
        ])
      ])
    ];
}
