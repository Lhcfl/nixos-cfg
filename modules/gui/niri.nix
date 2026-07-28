{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.os.gui.niri = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable niri module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.os.gui.niri.enable {
    programs.niri.enable = true;

    funkcia.os.gnome-keyring.enable = lib.mkDefault true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
