{ config, ... }:
let
  domain = config.funkcia.server.domains."mp".value;
  port = 3027;
in
{
  funkcia.server.domains.mp = { };

  services.misskey-media-proxy = {
    enable = true;
    inherit port;
  };

  services.nginx = {
    enable = true;

    virtualHosts.${domain} = {
      forceSSL = true;
      enableACME = true;

      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString port}";
        recommendedProxySettings = true;

        extraConfig = ''
          proxy_http_version 1.1;
          client_max_body_size 50M;
        '';
      };
    };
  };
}
