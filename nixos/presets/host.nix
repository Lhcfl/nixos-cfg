{ config, lib, ... }:
let
  cfg = config.funkcia.os.presets.host;
in
{
  options.funkcia.os.presets.host = {
    enable = lib.mkEnableOption "该系统是一台主机";
  };

  config = lib.mkIf cfg.enable {
    funkcia.os.presets.host = lib.mapAttrs (_: lib.mkDefault) {
      btrfs-tools.enable = true;
      collect-user.enable = true;
      programs.enable = true;
      root.enable = true;
      security.enable = true;
      services.enable = true;
      shell.enable = true;
    };
  };
}
