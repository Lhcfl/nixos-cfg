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

    # funkcia modules
    funkcia.os = {
      tpm.enable = true;
      tpm.tpm-fido.enable = true;
      # flatpak 非 Nix 软件的安装
      flatpak.enable = true;
    };

    funkcia.os.DE = {
      enable = true;

      displayManager.noctalia-greeter.enable = true;

      compositor.niri.enable = true;
      compositor.umbriel.enable = true;

      components.gnome.enable = true;
      components.noctalia.enable = true;
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

    # 打印机
    services.printing.enable = true;

    # 基于 Linux 内核模式设置（KMS）的用户空间虚拟控制台终端模拟器，
    # 替代传统位于 Linux 内核中的虚拟终端实现，且无需依赖 Xorg 或 Wayland 等图形服务器。
    # 用于在系统无法启动的时候更好的 tty
    services.kmscon.enable = true;

    environment.systemPackages = with pkgs; [
      xdg-user-dirs
    ];
  };
}
