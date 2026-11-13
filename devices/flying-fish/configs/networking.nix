{ lib, config, ... }: {
  sops.secrets = {
    "network/enX0/addr" = { };
    "network/enX0/mask" = { };
    "network/enX0/gateway" = { };
  };

  funkcia.os.configure-ip.enable = true;
  funkcia.os.configure-ip.v4.enX0 = {
    addr = config.sops.placeholder."network/enX0/addr";
    mask = config.sops.placeholder."network/enX0/mask";
    gateway = config.sops.placeholder."network/enX0/gateway";
  };

  networking.firewall.allowedTCPPorts = lib.mkForce [ 4430 ];

  funkcia.os.firewall.allow-cloudflare = {
    enable = true;
    allowedTCPPorts = [ 443 ];
  };
}
