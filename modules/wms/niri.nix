{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.modules.wms.niri = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable niri module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.wms.niri.enable {
    programs.niri.enable = true;

    funkcia.modules.gnome-keyring.enable = lib.mkDefault true;

    environment.systemPackages = with pkgs; [
      xwayland-satellite
    ];
  };
}
