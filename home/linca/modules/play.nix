{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.linca.play;
in
{
  options.linca.play.enable = lib.mkEnableOption "packages for play";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      go-musicfox # music
    ];
  };
}
