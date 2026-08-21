{ lib, config, ... }:
let
  cfg = config.funkcia.os.configure-ip;

  sops-option =
    description:
    lib.mkOption {
      inherit description;
      example = lib.literalExpression "config.sops.placeholder.xxx";
      type = lib.types.str;
    };
in
{
  options.funkcia.os.configure-ip = {
    enable = lib.mkEnableOption "configure ip by sops-nix";
    v4 = lib.mkOption {
      description = "match the device";
      type = lib.types.attrsOf (
        lib.types.submodule {
          options = {
            addr = sops-option "address, example: 123.45.67.89";
            mask = sops-option "mask, example: 32";
            gateway = sops-option "gateway, example: 1.2.3.4";
          };
        }
      );
    };
  };

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf (!config.systemd.network.enable) {
        config.sops.templates."configure-ip.sh".content = lib.pipe cfg.v4 [
          lib.attrsToList
          (map (
            { name, value }: ''
              # begin configure for ${name}
              ip addr add ${value.addr}/${value.mask} dev ${name}
              ip route add ${value.gateway}/${value.mask} dev ${name}
              ip route add default via ${value.gateway} dev ${name}
              # end configure for ${name}
            ''
          ))
          (builtins.concatStringsSep "\n")
        ];

        systemd.services."configure-ip" = {
          script = "sh ${config.sops.templates."configure-ip.sh".path}";
          wantedBy = [ "multi-user.target" ];
          requires = [ "network-online.target" ];
          after = [ "network-online.target" ];
        };

      })
      (lib.mkIf (config.systemd.network.enable) {
        config.sops.templates = lib.mapAttrs' (name: value: {
          name = "configure-ip-for-${name}";
          value = ''
            [Match]
            Name=${name}

            [Network]
            Address=${value.addr}/${value.mask}
            Gateway=${value.gateway}
          '';
        }) cfg.v4;

        environment.etc = lib.mapAttrs' (name: value: {
          name = "systemd/network/45-configure-ip-for-${name}.network".source;
          value = config.sops.templates."configure-ip-for-${name}".path;
        }) cfg.v4;
      })
    ]
  );
}
