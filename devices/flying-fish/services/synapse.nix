{
  config,
  lib,
  pkgs,
  ...
}:
let
  domain = config.flying-fish.prefix-domain "mat";
  port = 8008;

  # ===== 迁移开关（分阶段切换）=====
  # 1. 都关：仅暴露矩阵但不服务（迁移前）
  # 2. enableSynapse=true：启动 synapse
  # 3. enableNginx=true：恢复矩阵对外 nginx
  enableSynapse = true;
  enableNginx = false;
in
{
  flying-fish.domains = lib.mkIf enableNginx [ domain ];

  services.matrix-synapse = {
    enable = enableSynapse;
    settings = {
      server_name = domain;

      listeners = [
        {
          port = port;
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

      # 本机 PostgreSQL，走 unix socket + peer auth（不需要密码）
      database.args = {
        host = "/run/postgresql";
        database = "matrix-synapse";
        user = "matrix-synapse";
      };
    };

    # secrets (registration_shared_secret / macaroon_secret_key / form_secret)
    # 放在机器上的文件里，不进 nix store / git
    extraConfigFiles = [ "/var/lib/matrix-synapse/secrets.yaml" ];
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

    virtualHosts = lib.mkIf enableNginx {
      ${domain} = {
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
          proxyPass = "http://127.0.0.1:${toString port}";
          recommendedProxySettings = true;

          extraConfig = ''
            proxy_http_version 1.1;
            client_max_body_size 50M;
          '';
        };

        locations."/" =
          let
            cinny-config = pkgs.writeText "cinny-config" (
              builtins.toJSON {
                "defaultHomeserver" = 0;
                "homeserverList" = [ domain ];
                "allowCustomHomeservers" = false;

                "featuredCommunities" = {
                  "openAsDefault" = false;
                  "spaces" = [ ];
                  "rooms" = [ ];
                  "servers" = [ ];
                };

                "hashRouter" = {
                  "enabled" = true;
                  "basename" = "/";
                };
              }
            );

            cinny = pkgs.symlinkJoin {
              name = "cinny-configured";
              paths = [ pkgs.cinny ];

              postBuild = ''
                rm $out/config.json
                cp ${cinny-config} $out/config.json
              '';
            };
          in
          {
            root = "${cinny}";
          };
      };
    };
  };
}
