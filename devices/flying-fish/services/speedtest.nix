{ config, ... }:
let
  domain = config.flying-fish.prefix-domain "speedtest";
  port = 11451;
in
{
  flying-fish.domains = [ domain ];

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
          proxy_set_header Upgrade $http_upgrade;
          proxy_set_header Connection "upgrade";
        '';
      };
    };
  };
}
