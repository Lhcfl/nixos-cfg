{ config, ... }: {
  funkcia.os.domains.pi = { };

  services.caddy.virtualHosts.${config.funkcia.os.domains.pi} = {
    serverAliases = [ "ws.${config.funkcia.os.domain.suffix}" ];

    extraConfig = ''
      # 自签，不尝试公网 ACME
      tls internal

      reverse_proxy 127.0.0.1:30141
    '';
  };
}
