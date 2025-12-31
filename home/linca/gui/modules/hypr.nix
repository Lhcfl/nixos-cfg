{ config, lib, ... }:
{
  config = lib.mkIf config.funkcia.hm.gui.enable {
    services.hyprpolkitagent.enable = true;
  };
}
