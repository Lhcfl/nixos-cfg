{ config, lib, ... }:
{
  config = lib.mkIf config.funkcia.hm.gui.enable {
    programs.vicinae = {
      enable = true;
      systemd = {
        enable = true;
        autoStart = true;
      };
    };
  };
}
