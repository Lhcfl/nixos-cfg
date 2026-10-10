{ lib, config, ... }:
let
  cfg = config.linca.rclone;
in
{
  options.linca.rclone.enable = lib.mkEnableOption "connect to my personal webdav and etc";

  config = lib.mkIf cfg.enable {
    programs.rclone = {
      enable = true;

      # TODO: add config
    };
  };
}
