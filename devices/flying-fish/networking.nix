{ ... }: {
  networking.useDHCP = false;
  systemd.network.enable = true;

  sops.secrets = {
    "network/enX0/addr" = { };
    "network/enX0/mask" = { };
    "network/enX0/gateway" = { };
  };

  funkcia.os.configure-ip.enable = true;
  funkcia.os.configure-ip.v4.enX0 = {
    addr.secret = "network/enX0/addr";
    mask.secret = "network/enX0/mask";
    gateway.secret = "network/enX0/gateway";
  };
}
