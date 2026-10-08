{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.funkcia.os.presets.server.enable = lib.mkEnableOption "这台机器是服务器机器";

  config = lib.mkIf config.funkcia.os.presets.server.enable {
    funkcia.os.presets.host.enable = true;
    services.openssh.enable = true;

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
