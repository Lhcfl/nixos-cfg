# pi-web：仅监听本机 30141，经 Caddy 在 pi.workstation.internal 上以 HTTPS 暴露。
{ config, ... }: {
  funkcia.os.domains.pi = { };

  services.caddy.virtualHosts.${config.funkcia.os.domains.pi.value} = {
    extraConfig = ''
      # 自签，不尝试公网 ACME
      tls internal

      reverse_proxy 127.0.0.1:30141
    '';
  };
}
