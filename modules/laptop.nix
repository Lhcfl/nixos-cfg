{ config, lib, ... }:
{
  options.funkcia.modules.laptop = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable laptop module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.laptop.enable {
    powerManagement.enable = false;
    services.tlp.enable = true; # tlp is a good power management tool for laptops
    services.tlp.pd.enable = true;
  };
}
