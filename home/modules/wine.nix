{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.funkcia.hm.wine.enable = lib.mkEnableOption "Enable Wine";

  config = lib.mkIf config.funkcia.hm.wine.enable {
    home.packages = with pkgs; [
      # support both 32-bit and 64-bit applications
      wineWow64Packages.stable

      # # wine-staging (version with experimental features)
      # wineWow64Packages.staging

      # # winetricks (all versions)
      winetricks

      # native wayland support (unstable)
      # wineWow64Packages.waylandFull
    ];
  };
}
