{ ... }: {
  networking.useDHCP = false;
  systemd.network.enable = true;

  sops.secrets = {
    "network/ens3/addr" = { };
    "network/ens3/mask" = { };
    "network/ens3/gateway" = { };
  };

  funkcia.os.configure-ip.enable = true;
  funkcia.os.configure-ip.v4.ens3 = {
    addr.secret = "network/ens3/addr";
    mask.secret = "network/ens3/mask";
    gateway.secret = "network/ens3/gateway";
  };
}
