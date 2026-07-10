{
  inputs,
  config,
  lib,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  options.funkcia.hm.ricing.transparency.enable = lib.mkEnableOption "使得一些软件变得透明";

  config = lib.mkIf config.funkcia.hm.ricing.transparency.enable {
    funkcia.gui.niri.settings = (
      with kdl.extras.niri;
      kdl.formats.v1 [
        (window-rule [
          (match { app-id = "code"; })
          (match { app-id = "org.telegram.desktop"; })
          (match { app-id = "v2rayN"; })
          (match { app-id = "org.gnome.Nautilus"; })
          (opacity 0.9)
          (background-effect [
            (blur true)
          ])
        ])
      ]
    );
  };
}
