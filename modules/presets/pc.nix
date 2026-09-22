{
  lib,
  config,
  ...
}:
{
  options.funkcia.os.presets.pc.enable = lib.mkEnableOption "这台机器是日用机器";

  config = lib.mkIf config.funkcia.os.presets.pc.enable {
    # funkcia modules
    funkcia.os = {
      tpm.enable = true;
      nix-mirrors.enable = true;
      gui = {
        enable = true;
        niri.enable = true;
      };
      dm.noctalia-greeter.enable = true;
    };

    # 使用 network manager
    networking.networkmanager.enable = true;

    # accounts daemon 管理用户相关配置
    services.accounts-daemon.enable = true;

    # 蓝牙
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    # flatpak 非 Nix 软件的安装
    services.flatpak.enable = true;

    # 游戏
    programs.steam.enable = true;
  };
}
