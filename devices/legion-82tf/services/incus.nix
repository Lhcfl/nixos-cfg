{ ... }: {
  virtualisation.incus = {
    enable = true;
    ui.enable = true;

    # 声明式初始化：存储池、网桥、default profile。
    # 参考 nixpkgs nixos/tests/incus 与 NixOS Wiki 的 preseed 示例。
    preseed = {
      storage_pools = [
        {
          name = "default";
          driver = "btrfs";
        }
      ];

      networks = [
        {
          name = "incusbr0";
          type = "bridge";
          config = {
            "ipv4.address" = "172.24.0.1/24";
            "ipv4.nat" = "true";
          };
        }
      ];

      profiles = [
        {
          name = "default";
          devices = {
            root = {
              path = "/";
              pool = "default";
              type = "disk";
            };
            eth0 = {
              name = "eth0";
              network = "incusbr0";
              type = "nic";
            };
          };
        }
      ];
    };
  };

  networking.firewall.trustedInterfaces = [ "incusbr0" ];

  # 默认防火墙会丢弃容器发往宿主 dnsmasq 的 DHCPv4(67)/DNS(53)，
  # 实例因此拿不到 IPv4。放行这两个端口，或者信任整个网桥
  # networking.firewall.interfaces.incusbr0.allowedTCPPorts = [
  #   53
  #   67
  # ];
  # networking.firewall.interfaces.incusbr0.allowedUDPPorts = [
  #   53
  #   67
  # ];
}
