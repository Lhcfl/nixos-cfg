{
  config,
  options,
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

    proxy = options.networking.proxy.default;
  };

  config = lib.mkIf config.funkcia.os.networking.enable {
    networking = {
      # Configure network proxy if necessary
      proxy = lib.mkIf (cfg.proxy != null) {
        default = cfg.proxy;
        noProxy = "127.0.0.1,localhost,internal.domain";
      };

      networkmanager.enable = true;
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
