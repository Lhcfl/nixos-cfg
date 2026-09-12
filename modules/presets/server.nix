{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.funkcia.os.preset == "server") {
    funkcia.os.fonts.enable = false;
    services.openssh.enable = true;

    nix.settings.trusted-users = [
      "root"
      "@wheel"
    ];

    networking.firewall.allowedTCPPorts = [
      80 # HTTP
      443 # HTTPS
    ];

    systemd.network.enable = lib.mkDefault true;
    networking.useDHCP = false; # server's ip ususally is manually configured
  };
}
