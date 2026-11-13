{
  config,
  this,
  lib,
  pkgs,
  ...
}:
let
  cloudflare-ips.v4 = [
    "173.245.48.0/20"
    "103.21.244.0/22"
    "103.22.200.0/22"
    "103.31.4.0/22"
    "141.101.64.0/18"
    "108.162.192.0/18"
    "190.93.240.0/20"
    "188.114.96.0/20"
    "197.234.240.0/22"
    "198.41.128.0/17"
    "162.158.0.0/15"
    "104.16.0.0/13"
    "104.24.0.0/14"
    "172.64.0.0/13"
    "131.0.72.0/22"
  ];

  cloudflare-ips.v6 = [
    "2400:cb00::/32"
    "2606:4700::/32"
    "2803:f800::/32"
    "2405:b500::/32"
    "2405:8100::/32"
    "2a06:98c0::/29"
    "2c0f:f248::/32"
  ];
in
{
  this.options = {
    enable = lib.mkEnableOption "allow cloudflare ips";
    allowedTCPPorts = lib.mkOption {
      type = lib.types.listOf lib.types.int;
      default = [
        80
        443
      ];
      description = "allowed TCP ports";
    };
  };

  config = lib.mkIf this.config.enable {
    assertions = [
      {
        assertion = config.networking.nftables.enable;
        message = "you must enable nftables";
      }
    ];

    # 把 Cloudflare 地址段集合声明进防火墙自己的表（nixos-fw）。
    networking.nftables.tables."nixos-fw".content = lib.mkAfter ''
      set cloudflare_v4 {
        type ipv4_addr
        flags interval
        elements = { ${lib.concatStringsSep ", " cloudflare-ips.v4} }
      }
      set cloudflare_v6 {
        type ipv6_addr
        flags interval
        elements = { ${lib.concatStringsSep ", " cloudflare-ips.v6} }
      }
    '';

    networking.firewall.extraInputRules = lib.mkMerge (
      map (port: ''
        ip saddr @cloudflare_v4 tcp dport ${toString port} accept comment "allow cloudflare ips"
        ip6 saddr @cloudflare_v6 tcp dport ${toString port} accept comment "allow cloudflare ips"
      '') this.config.allowedTCPPorts
    );

    systemd.services.cloudflare-ips-refresh = {
      description = "Refresh Cloudflare IP ranges used by the nftables firewall";
      after = [
        "nftables.service"
        "network-online.target"
      ];
      wants = [ "network-online.target" ];
      # nftables 后端下规则由 nftables.service 加载，不存在 firewall.service。
      requires = [ "nftables.service" ];
      # 脚本用 nushell 原生 http 拉取，只需 PATH 里有 nft。
      path = [ pkgs.nftables ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.writers.writeNu "cloudflare-ips-refresh" ./cloudflare-ip.nu}";
      };
    };

    systemd.timers.cloudflare-ips-refresh = {
      description = "Periodically refresh Cloudflare IP ranges";
      wantedBy = [ "timers.target" ];
      timerConfig = {
        Unit = "cloudflare-ips-refresh.service";
        OnBootSec = "2min";
        OnUnitActiveSec = "12h";
      };
    };
  };
}
