{ config, ... }:
let
  domain = config.flying-fish.prefix-domain "mp";
  port = 3027;
in
{
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
