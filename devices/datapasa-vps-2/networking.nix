{ ... }: {
  networking.useDHCP = false;

  networking.defaultGateway = {
    address = "10.0.0.1";
    interface = "ens3";
  };
}
