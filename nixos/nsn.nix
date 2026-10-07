{
  this,
  lib,
  options,
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
      (lib.imap1 (i: v: v // { idx = i; }))
      (map (
        {
          name,
          value,
          idx,
        }:
        lib.nameValuePair name (
          lib.mkMerge [
            value
            (lib.mapAttrs (_: lib.mkDefault) {
              autoStart = false;
              privateNetwork = true;

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

              config = { ... }: {
                imports = [ self.nixosModules.default ];
                config.funkcia.os.presets.container.enable = true;
              };
            }
          ]
        )
      ))
      lib.listToAttrs
    ];
  };
}
