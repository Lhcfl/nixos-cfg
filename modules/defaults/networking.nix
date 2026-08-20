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
      # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Configure network proxy if necessary
      proxy = lib.mkIf (cfg.proxy != null) {
        default = cfg.proxy;
        noProxy = "127.0.0.1,localhost,internal.domain";
      };

      # Enable networking
      networkmanager.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      nameservers = [
        "1.1.1.1"
        "8.8.8.8"
      ];

      firewall.enable = true;
      nftables.enable = true;
    };
  };
}
