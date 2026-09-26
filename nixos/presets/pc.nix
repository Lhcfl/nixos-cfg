{
  lib,
  config,
  pkgs,
  ...
}:
{

  options.funkcia.os.presets.pc.enable = lib.mkEnableOption "这台机器是日用机器";

  config = lib.mkIf config.funkcia.os.presets.pc.enable {
    funkcia.os.presets.host.enable = true;
    funkcia.os.extra-fonts.enable = true;

    # funkcia modules
    funkcia.os = {
      tpm.enable = true;
      gui = {
        enable = true;
        niri.enable = true;
      };
      displayManager.noctalia-greeter.enable = true;
      # flatpak 非 Nix 软件的安装
      flatpak.enable = true;
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

    # allow appimage
    programs.appimage = {
      enable = true;
      binfmt = true;
    };

    # PipeWire is a relatively new (first release in 2017) low-level multimedia framework.
    # rtkit is optional but recommended
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
    };

    # 游戏
    programs.steam.enable = true;

    # 固件更新
    services.fwupd.enable = true;

    # 供桌面自动挂载 U 盘/移动盘
    services.udisks2.enable = true;

    # xdg user dir
    environment.systemPackages = with pkgs; [
      xdg-user-dirs
    ];
  };
}
