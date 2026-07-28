{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.os.btrbk = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable btrbk module.
        btrbk - Backup tool for Btrfs filesystems
      '';
    };
  };

  config = lib.mkIf config.funkcia.os.btrbk.enable {
    environment.systemPackages = with pkgs; [
      btrbk
    ];

    services.btrbk.instances = {
      "home" = {
        onCalendar = "hourly";
        settings = {
          timestamp_format = "long";
          snapshot_preserve_min = "1w";
          snapshot_preserve = "2w";
          volume = {
            "/" = {
              snapshot_dir = "/snapshots/home";
              subvolume = "home";
            };
          };
        };
      };
    };

    # Btrbk does not create snapshot directories automatically, so create one here.
    systemd.tmpfiles.rules = [
      "d /snapshots/home 0755 root root"
    ];
  };
}
