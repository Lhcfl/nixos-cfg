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
  };

  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      ports = cfg.ports;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        AllowUsers = [ "root" ];
      };
    };

    networking.firewall.allowedTCPPorts = cfg.ports;
  };
}
