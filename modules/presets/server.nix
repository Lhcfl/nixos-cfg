{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.funkcia.os.preset == "server") {
    funkcia.os = {
      fonts.enable = false;
      sshd.enable = true;
    };

    nix.settings.trusted-users = [
      "root"
      "@wheel"
    ];

    networking.firewall.allowedTCPPorts = lib.mkMerge [
      [
        80 # HTTP
        443 # HTTPS
      ]
      (lib.mkIf config.services.openssh.enable config.services.openssh.ports)
    ];

    systemd.network.enable = lib.mkDefault true;
    networking.useDHCP = false; # server's ip ususally is manually configured
  };
}
