{ lib, config, ... }:
let
  cfg = config.funkcia.os.sshd;
in
{
  options.funkcia.os.sshd = {
    enable = lib.mkEnableOption "sshd module";
    ports = lib.mkOption {
      type = lib.types.listOf lib.types.int;
      description = "the port that sshd listen; will automately add in networking.firewall.allowedTCPPorts";
      default = [ 22 ];
    };
    openFirewall = lib.mkOption {
      description = "open the port in firewall";
      type = lib.types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = cfg.ports;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    networking.firewall.allowedTCPPorts = lib.mkIf cfg.openFirewall cfg.ports;
  };
}
