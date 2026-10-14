# 内网 HTTPS：Caddy 用共享的本地 CA（funkcia.os.local-ca）签证书，不接触公网 ACME。
#
# 这里只管 Caddy 本身和 CA 接线。每个服务在自己的模块里加一条 virtualHosts，
# 名字各用各的；某条需要额外名字（例如同时用 ws.xxx 访问）时，才在那一条上写
# serverAliases。
{
  config,
  ...
}:
{
  funkcia.os.local-ca.enable = true;

  funkcia.os.domain.suffix = "workstation.internal";

  # 裸 workstation.internal（value 覆盖默认的 <name>.<suffix>）
  funkcia.os.domains.host.value = "workstation.internal";

  users.users.caddy.extraGroups = [ "funkcia-local-ca" ];

  systemd.tmpfiles.settings.caddy-root-keys = {
    "/var/lib/caddy/.local/share/caddy/pki/authorities/local/root.key"."L+" = {
      mode = "0444";
      argument = config.funkcia.os.local-ca.keyPath;
    };
    "/var/lib/caddy/.local/share/caddy/pki/authorities/local/root.crt"."L+" = {
      mode = "0444";
      argument = config.funkcia.os.local-ca.crtPath;
    };
  };

  services.caddy = {
    enable = true;

    # 只开 443，不需要 80 上的 HTTP -> HTTPS 跳转
    globalConfig = ''
      auto_https disable_redirects
    '';

    # 由各服务模块填充，例如：
    #
    #   "foo.workstation.internal" = {
    #     serverAliases = [ "ws.workstation.internal" ];
    #     extraConfig = ''
    #       tls internal
    #       reverse_proxy 127.0.0.1:8080
    #     '';
    #   };
    virtualHosts = { };

    openFirewall = true;
  };
}
