{ self, inputs, ... }: {
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
    privateUsers = "pick";
    hostAddress = "172.25.0.1";
    localAddress = "172.25.0.2";
    specialArgs = { inherit inputs; };
    config = {
      imports = [
        self.nixosModules.shared
        self.nixosModules.default
        ./quan/configuration.nix
      ];
    };
  };
}
