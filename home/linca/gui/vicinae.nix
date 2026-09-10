{
  inputs,
  lib,
  config,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  programs.vicinae = {
    enable = config.funkcia.hm.gui.enable;
    systemd.enable = true;
  };

  funkcia.hm.gui.niri.settings = lib.mkIf (config.programs.vicinae.enable) (
    with kdl.extras.niri;
    kdl.formats.v1 [
      (layer-rule [
        (match { namespace = "vicinae"; })
        (background-effect [
          (xray false)
        ])
      ])
    ]
  );
}
