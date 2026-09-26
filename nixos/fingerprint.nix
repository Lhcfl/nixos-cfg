# 指纹识别模块

{
  config,
  lib,
  ...
}:
let
  cfg = config.funkcia.os.fingerprint;
in
{
  options.funkcia.os.fingerprint = {
    enable = lib.mkEnableOption "fingerprint module";
    todDriver = lib.mkOption {
      description = ''
        If simply enabling fprintd is not enough, try enabling fprintd.tod, and use one of the next four drivers:
          - pkgs.libfprint-2-tod1-elan; # Elan(04f3:0c4b) driver
          - pkgs.libfprint-2-tod1-vfs0090; # (Marked as broken as of 2025/04/23!) driver for 2016 ThinkPads
          - pkgs.libfprint-2-tod1-goodix-550a; # Goodix 550a driver (from Lenovo)

        see https://wiki.nixos.org/wiki/Fingerprint_scanner
      '';
      type = lib.types.nullOr lib.types.package;
      default = null;
    };
  };

  config = lib.mkIf cfg.enable {
    # the driver
    services.fprintd = {
      enable = true;

      tod = lib.mkIf (cfg.todDriver != null) {
        enable = true;
        driver = cfg.todDriver;
      };
    };

    security = {
      polkit.enable = true;

      polkit.extraConfig = ''
        polkit.addRule(function(action, subject) {
          if (action.id == "net.reactivated.fprint.device.enroll" &&
              subject.isInGroup("users")) {
            return polkit.Result.YES;
          }
        });
      '';

      pam.services = {
        login.fprintAuth = true;
        sudo.fprintAuth = true;
        polkit-1.fprintAuth = true;
      };
    };
  };
}
