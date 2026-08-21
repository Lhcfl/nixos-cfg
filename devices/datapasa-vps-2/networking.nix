{ config, ... }: {
  networking.useDHCP = false;

  sops.secrets = {
    "network/ens3/addr" = { };
    "network/ens3/mask" = { };
    "network/ens3/gateway" = { };
  };

  funkcia.os.configure-ip.enable = true;
  funkcia.os.configure-ip.v4.ens3 = {
    addr = config.sops.placeholder."network/ens3/addr";
    mask = config.sops.placeholder."network/ens3/mask";
    gateway = config.sops.placeholder."network/ens3/gateway";
  };
}
