{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.os.flatpak;

  mkRoSymBind = path: {
    device = path;
    fsType = "fuse.bindfs";
    options = [
      "ro"
      "resolve-symlinks"
    ];
  };

  aggregatedFonts = pkgs.buildEnv {
    name = "system-fonts";
    paths = config.fonts.packages;
    pathsToLink = [ "/share/fonts" ];
  };
in
{
  options.funkcia.os.flatpak.enable = lib.mkEnableOption "flatpak";

  config = lib.mkIf cfg.enable {
    # 不能软链接，flatpak 访问不到
    fileSystems."/usr/share/icons" = mkRoSymBind (config.system.path + "/share/icons");
    fileSystems."/usr/share/fonts" = mkRoSymBind (aggregatedFonts + "/share/fonts");
    system.fsPackages = [ pkgs.bindfs ];
  };
}
