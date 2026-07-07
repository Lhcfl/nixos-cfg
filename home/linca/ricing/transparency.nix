{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.hm.ricing.transparency.enable = lib.mkEnableOption "使得一些软件变得透明";

  config = lib.mkIf config.funkcia.hm.ricing.transparency.enable {
    programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
      { package = blur-my-shell; }
    ];
  };
}
