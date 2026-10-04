{ lib, config, ... }: {
  networking.useDHCP = false;
  systemd.network.enable = true;

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
}
