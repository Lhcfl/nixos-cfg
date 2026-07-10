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
  options.funkcia.hm.ricing.transparency = {
    enable = lib.mkEnableOption "使得一些软件变得透明" // {
      default = true;
    };

    opacity = lib.mkOption {
      type = lib.types.float;
      default = 0.8;
    };
  };

  config =
    let
      cfg = config.funkcia.hm.ricing.transparency;
    in
    lib.mkIf cfg.enable {
      funkcia.gui.niri.settings = (
        with kdl.extras.niri;
        kdl.formats.v1 [
          (window-rule [
            (match { app-id = "code"; })
            (match { app-id = "org.telegram.desktop"; })
            (match { app-id = "v2rayN"; })
            (match { app-id = "org.gnome.Nautilus"; })
            (opacity cfg.opacity)
            (background-effect [
              (blur true)
            ])
          ])
        ]
      );

      programs.alacritty.settings.window.opacity = cfg.opacity * 0.9;
      programs.kitty.settings.background_opacity = cfg.opacity * 0.9;
    };
}
