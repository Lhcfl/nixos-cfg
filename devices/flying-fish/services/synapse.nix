{ config, lib, ... }:
let
  domain = config.flying-fish.prefix-domain "mat";
in
{
  services.matrix-synapse = {
    enable = true;
    settings = {
      server_name = domain;

      listeners = [
        {
          port = 8008;
          bind_addresses = [
            "::1"
            "127.0.0.1"
          ];
          type = "http";
          tls = false;
          resources = [
            {
              names = [
                "client"
                "federation"
              ];
              compress = true;
            }
          ];
        }
      ];

      enable_registration = true;
      registration_requires_token = true;

      url_preview_enabled = true;
    };
  };

  services.nginx = {
    enable = true;

    virtualHosts.${domain} = {
      forceSSL = true;
      enableACME = true;

      locations."^/.well-known/matrix/server" = {
        extraConfig = ''
          default_type application/json;
        '';
        return = "200 '${
          builtins.toJSON {
            "m.server" = "${domain}:443";
          }
        }'";
      };

      locations."^(/_matrix|/_synapse/client|/_synapse/admin)" = {
        proxyPass = "http://127.0.0.1:8008";
        recommendedProxySettings = true;

        extraConfig = ''
          proxy_http_version 1.1;
          client_max_body_size 50M;
        '';
      };
    };
  };
}
