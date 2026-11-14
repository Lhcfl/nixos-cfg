{
  config,
  ...
}:
let
  domain = config.funkcia.os.domains.mat.value;
  port = 8008;

  owner = config.systemd.services.matrix-synapse.serviceConfig.User;
in
{
  sops.secrets."synapse/signing-key" = {
    inherit owner;
  };

  sops.secrets."synapse-secrets.yaml" = {
    inherit owner;
    format = "yaml";
    key = "";
    sopsFile = ./secret-config.yaml;
  };

  funkcia.os.domains.mat = { };

  services.matrix-synapse = {
    enable = true;
    settings = {
      server_name = domain;

      signing_key_path = config.sops.secrets."synapse/signing-key".path;

      listeners = [
        {
          inherit port;
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

      room_list_publication_rules = [
        { action = "allow"; }
      ];

      # 本机 PostgreSQL，走 unix socket + peer auth（不需要密码）
      database.args = {
        host = "/run/postgresql";
        database = "matrix-synapse";
        user = "matrix-synapse";
      };
    };

    # secrets (registration_shared_secret / macaroon_secret_key / form_secret)
    # 放在机器上的文件里，不进 nix store / git
    extraConfigFiles = [
      config.sops.secrets."synapse-secrets.yaml".path
    ];
  };

  services.postgresql = {
    enable = true;
    # Synapse 要求数据库 collation 为 'C'
    initdbArgs = [ "--locale=C" ];
    ensureDatabases = [ "matrix-synapse" ];
    ensureUsers = [
      {
        name = "matrix-synapse";
        ensureDBOwnership = true;
      }
    ];
  };

  # 确保 synapse 在 postgres 之后就绪
  systemd.services.matrix-synapse = {
    requires = [ "postgresql.target" ];
    after = [ "postgresql.target" ];
  };

  services.nginx = {
    enable = true;

    virtualHosts.${domain} = {
      forceSSL = true;
      enableACME = true;

      locations = {
        "~ ^/\\.well-known/matrix/server" = {
          extraConfig = ''
            default_type application/json;
          '';
          return = "200 '${
            builtins.toJSON {
              "m.server" = "${domain}:443";
            }
          }'";
        };

        "~ ^/(_matrix|_synapse/client|_synapse/admin)" = {
          proxyPass = "http://127.0.0.1:${toString port}";
          recommendedProxySettings = true;

          extraConfig = ''
            proxy_http_version 1.1;
            client_max_body_size 50M;
          '';
        };
      };
    };
  };
}
