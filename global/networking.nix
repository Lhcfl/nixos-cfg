{ config, lib, ... }: {
  options.funkcia.os.networking.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.funkcia.os.networking.enable {
    networking = {
      # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

      # Configure network proxy if necessary
      proxy.default = "http://127.0.0.1:10808";
      proxy.noProxy = "127.0.0.1,localhost,internal.domain";

      # Enable networking
      networkmanager.enable = true;

      # Open ports in the firewall.
      # networking.firewall.allowedTCPPorts = [ ... ];
      # networking.firewall.allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
      # networking.firewall.enable = false;

      firewall.enable = true;
      nftables.enable = true;
    };
  };
}
