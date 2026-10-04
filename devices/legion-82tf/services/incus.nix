{
  config,
  inputs,
  pkgs,
  ...
}:
let
  # 让登录 shell（incus shell）找到 /opt/nix/bin 里的 nix 客户端，
  # 并把 <nixpkgs> 指向仓库 flake 里那份 pinned nixpkgs。
  # 00- 前缀保证它在 /etc/profile.d 里最早被 source。
  nixPathScript = pkgs.writeText "00-nix-path.sh" ''
    export PATH="/opt/nix/bin:$PATH"
    export NIX_PATH="nixpkgs=${inputs.nixpkgs}"
    # 容器里是 uid 0，不加这个 Nix 会去用本地只读 store；
    # 指到宿主 daemon 后，build/install 都交给宿主做。
    export NIX_REMOTE=daemon
  '';
in
{
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
            # 只读复用宿主 /nix/store：容器里可直接运行宿主构建过的程序，
            # 且零额外空间（内容寻址去重）。写入仍由宿主 nix-daemon 负责。
            nix = {
              type = "disk";
              source = "/nix/store";
              path = "/nix/store";
              readonly = true;
            };
            # 复用宿主 nix-daemon：把 daemon 的 unix socket 挂进容器，
            # 容器里的 nix 客户端就能连到宿主 daemon。
            # 不设只读：connect() 需要 socket 的写权限。只挂 socket 目录，
            # 绝不挂可写的 /nix/var/nix/db。
            nix-daemon-socket = {
              type = "disk";
              source = "/nix/var/nix/daemon-socket";
              path = "/nix/var/nix/daemon-socket";
            };
            # 把宿主 nix 客户端的 bin 挂到 /opt/nix/bin（不覆盖 /usr/local/bin）。
            # 用 config.nix.package 自动跟踪宿主 nix 版本。
            nix-client = {
              type = "disk";
              source = "${config.nix.package}/bin";
              path = "/opt/nix/bin";
              readonly = true;
            };
            # 登录 shell 的 PATH 兜底：单文件只读挂载 profile.d 脚本。
            nix-profile-path = {
              type = "disk";
              source = "${nixPathScript}";
              path = "/etc/profile.d/00-nix-path.sh";
              readonly = true;
            };
            # 只读挂载宿主的 nix.conf，容器自动继承 experimental-features /
            # substituters / nix-path 等设置，且与宿主保持同步。
            nix-conf = {
              type = "disk";
              source = "/etc/nix/nix.conf";
              path = "/etc/nix/nix.conf";
              readonly = true;
            };
          };
        }
      ];
    };
  };

  systemd.services.incus.environment = config.funkcia.os.networking.environment;

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
