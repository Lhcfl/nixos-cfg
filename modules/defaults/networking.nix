{
  config,
  lib,
  ...
}:
let
  cfg = config.funkcia.os.networking;
in
{
  options.funkcia.os.networking = {
    enable = lib.mkEnableOption "networking related settings" // {
      default = true;
    };

    proxy = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = ''
        This option specifies the default value for httpProxy, httpsProxy, ftpProxy and rsyncProxy.
      '';
      example = "http://127.0.0.1:3128";
    };

    noProxy = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [
        "127.0.0.1"
        "localhost"
        "internal.domain"
        ".local"
      ];
      description = ''
        `no_proxy` 列表：命中的主机不走代理。以 `.` 开头表示整个域及其子域，
        例如 `.local` 覆盖所有 mDNS 名字。
      '';
      example = [
        ".lan"
        "example.internal"
      ];
    };
  };

  config = lib.mkIf config.funkcia.os.networking.enable {
    networking = {
      wireless.enable = true;

      # Configure network proxy if necessary
      proxy = lib.mkIf (cfg.proxy != null) {
        default = cfg.proxy;
        noProxy = lib.concatStringsSep "," cfg.noProxy;
        envVars.HTTP_PROXY = cfg.proxy;
        envVars.HTTP_PROXYS = cfg.proxy;
        envVars.NO_PROXY = lib.concatStringsSep "," cfg.noProxy;
      };

      nameservers = [
        "1.1.1.1"
        "8.8.8.8"
      ];

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];

      firewall.enable = true;
      nftables.enable = true;
    };
  };
}
