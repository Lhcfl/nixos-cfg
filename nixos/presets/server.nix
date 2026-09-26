{
  lib,
  config,
  ...
}:
{
  options.funkcia.os.presets.server.enable = lib.mkEnableOption "这台机器是服务器机器";

  config = lib.mkIf config.funkcia.os.presets.server.enable {
    funkcia.os.presets.host.enable = true;
    services.openssh.enable = true;

    # 从 kitty/foot/ghostty 等终端 SSH 登录时，远端需要对应的 terminfo 条目，
    # 否则 ncurses 程序会报 “cannot initialize terminal type”。
    # 一次装齐所有常见终端的 terminfo，避免以后换终端又踩坑。
    environment.enableAllTerminfo = true;

    networking.firewall.allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
    ];

    networking.useNetworkd = true;
    systemd.network.enable = true;
    networking.useDHCP = false; # server's ip ususally is manually configured

    # 把中断分散到多核
    services.irqbalance.enable = true;
  };
}
