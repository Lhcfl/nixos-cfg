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
  options.funkcia.os.gui.niri = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable niri module.
      '';
    };

    recommandSettings = lib.mkOption {
      type = lib.types.lines;
      default = [ ];
      description = ''
        funkcia: Recommanded settings for niri module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.os.gui.niri.enable {
    programs.niri.enable = true;
    funkcia.os.gnome-keyring.enable = lib.mkDefault true;

    funkcia.os.gui.niri.recommandSettings =
      with kdl.extras.niri;
      kdl.formats.v1 [
        (spawn-at-startup "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1")
        (xwayland-satellite [
          (n "path" "${lib.getExe pkgs.xwayland-satellite}")
        ])
        (environment [
          (n "NIXOS_OZONE_WL" "1")
        ])
      ];
  };
}
