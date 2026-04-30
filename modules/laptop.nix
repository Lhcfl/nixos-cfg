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

    using = lib.mkOption {
      type = lib.types.enum [
        "power-profiles-daemon"
        "tlp"
      ];
      default = "power-profiles-daemon";
      description = ''
        funkcia: Power management tool to use on laptops.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.laptop.enable (
    lib.mkMerge [
      {
        services.upower.enable = true; # show battery
      }

      (lib.mkIf (config.funkcia.modules.laptop.using == "power-profiles-daemon") {
        services.power-profiles-daemon.enable = true;
      })

      (lib.mkIf (config.funkcia.modules.laptop.using == "tlp") {
        powerManagement.enable = false;

        services.tlp = {
          enable = true; # tlp is a good power management tool for laptops
          pd.enable = true;

          settings = {
            TLP_PROFILE_AC = "BAL";
            PLATFORM_PROFILE_ON_AC = "balanced";
            TLP_PROFILE_BAT = "SAV";
          };
        };
      })
    ]
  );
}
