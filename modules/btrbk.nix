{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.os.btrbk = {
    enable = lib.mkEnableOption ''
      btrbk module. btrbk is a backup tool for Btrfs filesystems
    '';
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
          # 保留最近 24 小时内创建的所有快照（每小时快照全部保留）
          snapshot_preserve_min = "1d";
          # 保留最近 7 天的每日快照，以及最近 4 周的每周快照
          snapshot_preserve = "7d 4w";
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
