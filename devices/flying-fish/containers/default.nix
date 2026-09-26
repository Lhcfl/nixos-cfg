{ ... }: {
  networking.nat = {
    enable = true;
    # Use "ve-*" when using nftables instead of iptables
    internalInterfaces = [ "ve-*" ];
    # interface name
    externalInterface = "enX0";
  };

  containers.quan = {
    autoStart = true;
    privateNetwork = true;
    hostAddress = "172.25.0.1";
    localAddress = "172.25.0.2";
    config = ./quan/configuration.nix;
  };
}
