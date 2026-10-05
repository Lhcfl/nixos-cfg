{
  this,
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "incus to manage containers";

    mountNix = lib.mkEnableOption "mound /nix/store and other nix things into container" // {
      default = true;
    };

    trustInterface = lib.mkEnableOption "trust the whole `incusbr0` interface in firewall";

    profiles = lib.mkOption {
      description = "profiles";
      type = lib.types.attrsOf lib.types.json;
    };

    network.ipv4.address = lib.mkOption {
      default = "172.24.0.1/24";
      type = lib.types.str;
    };
  };

  config = lib.mkIf this.config.enable (
    lib.mkMerge [
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
                # 直接建在宿主 btrfs 上的子卷，不用 loop 文件，
                # 避免 btrfs-in-file-on-btrfs 的嵌套 CoW 写放大。
                config.source = "/var/lib/incus/storage-pools/default";
              }
            ];

            networks = [
              {
                name = "incusbr0";
                type = "bridge";
                config = {
                  "ipv4.address" = this.config.network.ipv4.address;
                  "ipv4.nat" = "true";
                };
              }
            ];

            profiles = lib.mapAttrsToList (
              name: c:
              lib.mkMerge [
                c
                { name = lib.mkDefault name; }
              ]
            ) config.funkcia.os.incus.profiles;
          };
        };

        funkcia.os.incus.profiles.default = {
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
        };

        systemd.services.incus.environment = config.funkcia.os.networking.environment;

        networking.firewall.trustedInterfaces = lib.mkIf this.config.trustInterface [ "incusbr0" ];

        # 默认防火墙会丢弃容器发往宿主 dnsmasq 的 DHCPv4(67)/DNS(53)，
        # 实例因此拿不到 IPv4。放行这两个端口，或者信任整个网桥
        networking.firewall.interfaces.incusbr0 = {
          allowedTCPPorts = [
            53
            67
          ];
          allowedUDPPorts = [
            53
            67
          ];
        };

        # 让宿主把 `.incus` 域名解析交给桥上 dnsmasq（172.24.0.1），于是可直接
        # `ssh debian.incus`（跟随容器动态 IP），且不污染全局 DNS。
        systemd.services.incus-dns = {
          description = "Route .incus DNS queries to the Incus bridge";
          after = [
            "incus.service"
            "systemd-resolved.service"
          ];
          requires = [ "systemd-resolved.service" ];
          partOf = [ "systemd-resolved.service" ];
          wantedBy = [ "multi-user.target" ];
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
          };
          script = ''
            ${pkgs.systemd}/bin/resolvectl dns incusbr0 ${builtins.head (lib.splitString "/" this.config.network.ipv4.address)}
            ${pkgs.systemd}/bin/resolvectl domain incusbr0 '~incus'
          '';
        };

        funkcia.os.networking.noProxy = [ ".incus" ];
      }

      (lib.mkIf this.config.mountNix (
        let
          # 登录 shell 的引导脚本：设好 nix 客户端 PATH / NIX_PATH / NIX_REMOTE，
          # 并 source 官方 nix profile.d（自动生成 NIX_PROFILES / PATH / XDG_DATA_DIRS 等）。
          nixPathScript = pkgs.writeText "00-nix-path.sh" ''
            export PATH="/mnt/host/nix/bin:$PATH"
            export NIX_PATH="nixpkgs=${inputs.nixpkgs}"
            # 容器里是 uid 0，不加这个 Nix 会去用本地只读 store；
            # 指到宿主 daemon 后，build/install 都交给宿主做。
            export NIX_REMOTE=daemon

            # 容器缺 xterm-kitty 等 terminfo，从挂进来的 /mnt/host/terminfo 找补。
            export TERMINFO_DIRS="/mnt/host/terminfo:''${TERMINFO_DIRS:-/etc/terminfo:/lib/terminfo:/usr/share/terminfo}"

            # source 官方 nix profile.d，不覆盖容器自身的 /etc/profile.d。
            if [ -d /mnt/host/nix/etc/profile.d ]; then
              for i in $(run-parts --list --regex '^[a-zA-Z0-9_][a-zA-Z0-9._-]*\.sh$' /mnt/host/nix/etc/profile.d); do
                if [ -r "$i" ]; then
                  . "$i"
                fi
              done
              unset i
            fi
          '';

          # 要挂进容器的东西打成一个 package，再用 environment.etc 暴露为 /etc/incus-nix
          # （稳定路径，且随系统闭包一起被 GC 保护），供容器挂载。
          source-to-mount = pkgs.runCommand "incus-nix" { } ''
            mkdir -p $out
            ln -s ${config.nix.package} $out/nix
            ln -s ${nixPathScript} $out/00-nix-path.sh
            # 容器里没有 xterm-kitty 等 terminfo，带上 kitty 的
            ln -s ${pkgs.kitty.terminfo}/share/terminfo $out/terminfo
          '';
        in
        {
          # 把打包好的 nix 客户端暴露为 /etc/incus-nix（NixOS 每次 activation 重建
          # 该符号链接，且它属于系统闭包，天然是 GC root）。
          environment.etc."incus-nix" = {
            enable = this.config.mountNix;
            source = source-to-mount;
          };

          funkcia.os.incus.profiles.default.devices = {
            # 只读复用宿主 /nix/store：容器里可直接运行宿主构建过的程序，
            # 且零额外空间（内容寻址去重）。写入仍由宿主 nix-daemon 负责。
            nix = {
              type = "disk";
              source = "/nix/store";
              path = "/nix/store";
              readonly = true;
            };
            # 复用宿主 nix-daemon：把 daemon 的 unix socket 挂进容器。
            # 不设只读：connect() 需要 socket 的写权限。只挂 socket 目录，
            # 绝不挂可写的 /nix/var/nix/db。
            nix-daemon-socket = {
              type = "disk";
              source = "/nix/var/nix/daemon-socket";
              path = "/nix/var/nix/daemon-socket";
            };
            # 挂载源是稳定路径 /etc/incus-nix，整个 bundle 落在 /mnt/host：
            # bin 是 nix 客户端，profile.d 是官方 profile 脚本。以后往 incusNix
            # 里加东西，会自动出现在 /mnt/host 下。
            nix-package = {
              type = "disk";
              source = "/etc/incus-nix";
              path = "/mnt/host";
              readonly = true;
            };
            # 登录 shell 的引导脚本（同样走稳定路径）。
            nix-profile-path = {
              type = "disk";
              source = "/etc/incus-nix/00-nix-path.sh";
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
      ))

      # 把宿主（loopback）上的代理端口转发进容器，使容器内
      # http://127.0.0.1:<port> 能走宿主的代理。
      # bind=instance：监听在容器侧、连到宿主侧。
      (
        let
          proxy = config.funkcia.os.networking.proxy;
          # 从 http://host:port 里取端口
          proxyPort = lib.last (lib.splitString ":" proxy);
        in
        lib.mkIf (proxy != null) {
          funkcia.os.incus.profiles.default.proxy = {
            type = "proxy";
            bind = "instance";
            listen = "tcp::${proxyPort}";
            connect = "tcp::${proxyPort}";
          };
        }
      )
    ]
  );
}
