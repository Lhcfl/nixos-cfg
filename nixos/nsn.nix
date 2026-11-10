{
  this,
  lib,
  self,
  inputs,
  funkcia-utils,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption ''
      NSN, ~~NixOS Subsystem of NixOS~~
    '';

    externalInterface = lib.mkOption {
      type = lib.types.str;
      description = "NAT 对外的 interface";
    };

    containers = lib.mkOption {
      type = lib.types.attrsOf lib.types.raw;
      description = ''
        该选项只是为 NixOS 的 `config.containers` 添加了一些默认值。
        会整体合并到 `config.containers`

        具体参见 NixOS Module 的 [`config.containers`](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/virtualisation/nixos-containers.nix)
      '';
    };
  };

  config = lib.mkIf this.config.enable {
    networking.nat = {
      enable = true;
      # Use "ve-*" when using nftables instead of iptables
      internalInterfaces = [ "ve-*" ];
      externalInterface = this.config.externalInterface;
      # Lazy IPv6 connectivity for the container
      enableIPv6 = true;
    };

    containers = lib.pipe this.config.containers [
      lib.attrsToList
      (lib.imap1 (
        idx: { name, value }: {
          inherit name;
          value = lib.mkMerge [
            value
            (lib.mapAttrs (_: lib.mkDefault) {
              autoStart = true;
              privateNetwork = true;
              # for safety
              privateUsers = "pick";

              hostAddress = "172.24.1.1";
              localAddress = "172.24.1.${toString (idx + 1)}";
              hostAddress6 = "fc00::1";
              localAddress6 = "fc00::${toString (idx + 1)}";
            })
            {
              specialArgs = {
                inherit inputs funkcia-utils;
              };

              config = {
                imports = [ self.nixosModules.default ];

                config = {
                  funkcia.os.presets.container.enable = true;

                  # 宿主侧的 ve-* 是在 container@.service 的 ExecStartPost 里
                  # 才 up 的，而 ExecStartPost 要等容器 ready 之后才执行。
                  # 如果容器内等待 network-online.target（例如 tailscaled
                  # 会 Wants 它），就会和宿主形成死锁，最终 TimeoutStartSec
                  # 超时导致容器启动失败。因此容器内不使用 wait-online。
                  systemd.network.wait-online.enable = false;
                };
              };
            }
          ];
        }
      ))
      lib.listToAttrs
    ];
  };
}
