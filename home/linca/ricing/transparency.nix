{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  options.funkcia.hm.ricing.transparency.enable = lib.mkEnableOption "使得一些软件变得透明";

  config = lib.mkIf config.funkcia.hm.ricing.transparency.enable {
    programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
      { package = blur-my-shell; }
    ];

    xdg.configFile."niri/transparency.kdl".text =
      with kdl.extras.niri;
      kdl.formats.v1 [
        (window-rule [
          (match { app-id = "code"; })
          (match { app-id = "org.telegram.desktop"; })
          (opacity 0.9)
          (background-effect [
            (blur true)
          ])
        ])
      ];
  };
}
