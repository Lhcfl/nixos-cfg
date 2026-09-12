{
  lib,
  pkgs,
  ...
}:
let
  # 把 origin 的 443 限制为「只有 Cloudflare 边缘能回源」。
  #
  # ⚠️ 前提：域名的 Cloudflare DNS 记录必须是「已代理 / proxied（橙云）」。
  #   - 橙云：访客 -> Cloudflare 边缘 ->（来自下列 CF 地址段）-> origin，白名单生效。
  #   - 灰云：访客直接连 origin IP，源地址不是 Cloudflare，白名单会把所有人都挡在外面。
  # 本仓库里的 mat./mp./vw./write./speedtest./s.stelpolva.moe 解析到的都是
  # Cloudflare 地址（104.21.82.146 / 172.67.158.173），即橙云。
  #
  # 下面只是构建时的「种子」，保证开机或 firewall 重载后到计时器刷新前也可用；
  # cloudflare-ips-refresh.timer 会定期从官方端点刷新 nft 集合，IP 变动无需重建。
  seedV4 = [
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

  seedV6 = [
    "2400:cb00::/32"
    "2606:4700::/32"
    "2803:f800::/32"
    "2405:b500::/32"
    "2405:8100::/32"
    "2a06:98c0::/29"
    "2c0f:f248::/32"
  ];

  # 从官方端点刷新集合（nushell 脚本，见 ./networking/cloudflare-ip.nu）。
  # 整体用一次 `nft -f` 事务提交，中途失败不会留下空集合。
  refreshScript = pkgs.writers.writeNu "cloudflare-ips-refresh" ./cloudflare-ip.nu;
in
{
  # 不再对全网开放 80/443：80 直接关闭（Cloudflare 边缘负责 HTTP->HTTPS 跳转），
  # 443 改由下面的 extraInputRules 只对 Cloudflare 地址段开放。
  networking.firewall.allowedTCPPorts = lib.mkForce [ ];

  # 把 Cloudflare 地址段集合声明进防火墙自己的表（nixos-fw）。
  networking.nftables.tables."nixos-fw".content = lib.mkAfter ''
    set cloudflare_v4 {
      type ipv4_addr
      flags interval
      elements = { ${lib.concatStringsSep ", " seedV4} }
    }
    set cloudflare_v6 {
      type ipv6_addr
      flags interval
      elements = { ${lib.concatStringsSep ", " seedV6} }
    }
  '';

  networking.firewall.extraInputRules = ''
    ip saddr @cloudflare_v4 tcp dport 443 accept comment "cloudflare https"
    ip6 saddr @cloudflare_v6 tcp dport 443 accept comment "cloudflare https"
  '';

  systemd.services.cloudflare-ips-refresh = {
    description = "Refresh Cloudflare IP ranges used by the nftables firewall";
    after = [
      "firewall.service"
      "network-online.target"
    ];
    wants = [ "network-online.target" ];
    requires = [ "firewall.service" ];
    # 脚本用 nushell 原生 http 拉取，只需 PATH 里有 nft。
    path = [ pkgs.nftables ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${refreshScript}";
    };
  };

  systemd.timers.cloudflare-ips-refresh = {
    description = "Periodically refresh Cloudflare IP ranges";
    wantedBy = [ "timers.target" ];
    timerConfig = {
      Unit = "cloudflare-ips-refresh.service";
      OnBootSec = "2min";
      OnUnitActiveSec = "12h";
      Persistent = true;
    };
  };
}
