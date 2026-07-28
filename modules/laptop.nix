{ config, lib, ... }:
let
  cfg = config.funkcia.os.laptop;
in
{
  options.funkcia.os.laptop = {
    enable = lib.mkEnableOption "Enable laptop related settings.";

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

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      {
        services.upower.enable = true; # show battery
      }

      (lib.mkIf (cfg.using == "power-profiles-daemon") {
        services.power-profiles-daemon.enable = true;
      })

      (lib.mkIf (cfg.using == "tlp") {
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
