# 内网 HTTPS：Caddy 用自带的本地 CA 签证书（`tls internal`），不接触公网 ACME。
{ lib, config, ... }:
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

    virtualHosts = lib.flip lib.mapAttrs' config.funkcia.os.domains (
      _: domain: {
        name = domain.value;
        value = {
          serverAliases = [ "ws.${config.funkcia.os.domain.suffix}" ];

          extraConfig = ''
            # 自签，不尝试公网 ACME
            tls internal

            # TODO: 换成这台机器真正要暴露的服务，例如
            #   reverse_proxy 127.0.0.1:8080
          '';
        };
      }
    );

    openFirewall = true;
  };
}
