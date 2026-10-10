{ config, lib, ... }:
let
  host = config.funkcia.os.domains.drive.value;

  secrets = {
    System.SessionSecret = null;
  };
in
{
  funkcia.os.domains.drive = { };

  services.cloudreve = {
    enable = true;

    port = 5212;

    nginx = {
      inherit host;
      enable = true;
      forceSSL = true;
      enableACME = true;
    };

    settings = {
      System = {
        # 运行模式，可选值为 master/slave
        Mode = "master";
        # 是否开启 Debug 模式，默认为 false
        Debug = true;
        # 呈递客户端 IP 时使用的 Header，默认为空。如果该 Header 由多个使用 `,` 分隔的 IP 构成，Cloudreve 会取用首个作为客户端 IP
        # 对于配置反向代理的部署，可以取值为 X-Forwarded-For。但是，请注意，由于潜在的 XFF 注入问题，仅在确认可信的情况下使用
        ProxyHeader = "X-Forwarded-For";
        # 进程安全退出的最长缓冲时间，默认为 0，不限制
        GracePeriod = 2000;
        # SSL 相关
      };
      # 数据库相关，如果你只想使用内置的 SQLite 数据库，这一部分直接删去即可
      Database = {
        # 数据库类型，目前支持 sqlite/mysql/postgres/mariadb，默认为 sqlite
        Type = "postgres";
        # 数据库端口
        Port = 5432;
        # 用户名，默认为空
        User = "cloudreve";
        # 数据库地址，默认为空
        Host = "/run/postgresql";
        # 数据库名称，默认为空
        Name = "cloudreve";
        # 使用 Unix Socket 连接到数据库，默认为 false，如需开启，请在 Host 中指定 Unix Socket 路径
        UnixSocket = true;
        # 数据库连接字符串，如果设置，其他数据库配置将忽略，但 Type 仍需设置。
        # 例如：root:123456@tcp(127.0.0.1:3306)/cloudreve?charset=utf8mb4&parseTime=True&loc=Local 用于 MySQL。
        # DatabaseURL = "";
      };

      CORS = {
        AllowOrigins = "*";
        AllowMethods = "OPTIONS,GET,POST";
        AllowHeaders = "*";
        AllowCredentials = false;
      };

      # Redis 相关
      # Redis = {
      #   # 连接类型，默认为 tcp
      #   Network = "tcp";
      #   # 服务器地址，默认为空，不启用
      #   Server = "127.0.0.1:6379";
      #   # 数据库，默认为 0
      #   DB = "cloudreve";
      #   # 用户名，默认为空
      #   User = "cloudreve";
      #   # 是否使用 TLS 连接到 Redis，默认为 false
      #   UseTLS = false;
      #   # 是否跳过 TLS 验证，默认为 false
      #   TLSSkipVerify = false;
      # };
    };

    environmentFile = config.sops.templates."cloudreve-conf-env".path;
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "cloudreve" ];
    ensureUsers = [
      {
        name = "cloudreve";
        ensureDBOwnership = true;
      }
    ];
  };

  systemd.services.cloudreve.after = [ "postgresql.target" ];

  sops.secrets = lib.pipe secrets [
    (lib.mapAttrsToListRecursive (
      path: v: {
        name = "cloudreve/" + (builtins.concatStringsSep "/" path);
        value = { };
      }
    ))
    lib.listToAttrs
  ];

  sops.templates."cloudreve-conf-env".content = lib.pipe secrets [
    (lib.mapAttrsToListRecursive (
      path: v: {
        key = "CR_CONF_${builtins.concatStringsSep "__" path}";
        value = config.sops.placeholder."${"cloudreve/" + (builtins.concatStringsSep "/" path)}";
      }
    ))
    (map ({ key, value }: "${key}=${value}"))
    (builtins.concatStringsSep "\n")
  ];
}
