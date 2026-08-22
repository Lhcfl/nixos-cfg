{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.os.configure-ip;

  maybeSecretOption =
    description:
    let
      types = lib.types;
    in

    lib.mkOption {
      description = ''
        ${description}

        Maybe a SOPS secret.
      '';
      type = types.oneOf [
        types.str
        (types.submodule {
          options.secret = lib.mkOption { type = types.str; };
        })
      ];
      example = lib.literalMD ''
        设置为下列两种值的一种。

        - 明文：此时直接设置值，比如 `"123.45.67.89"`

        - 密文：此时设置 secret = key，比如，如果 `config.sops.placeholder.key-name` 是对应了 `"123.45.67.89"` 的 sops，则设置为：

        ```nix
        { secret = "key-name"; }
        ```
      '';
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
            addr = maybeSecretOption "address, example: 123.45.67.89";
            mask = maybeSecretOption "mask, example: 32";
            gateway = maybeSecretOption "gateway, example: 1.2.3.4";
          };
        }
      );
    };
  };

  config =
    let
      getValue = x: if x ? "secret" then config.sops.placeholder.${x.secret} else x;
    in
    lib.mkIf cfg.enable (
      lib.mkMerge [
        (lib.mkIf (!config.systemd.network.enable) {
          sops.templates."configure-ip.sh".content = lib.pipe cfg.v4 [
            lib.attrsToList
            (map (
              { name, value }:
              ''
                # begin configure for ${name}
                ip addr add ${getValue value.addr}/${getValue value.mask} dev ${name}
                ip route add ${getValue value.gateway}/${getValue value.mask} dev ${name}
                ip route add default via ${getValue value.gateway} dev ${name}
                # end configure for ${name}
              ''
            ))
            (builtins.concatStringsSep "\n")
            (x: "set +e\n${x}\ntrue") # todo: ip addr add 可能重复而忽略错误；或许有什么改善方法？
          ];

          systemd.services."configure-ip" = {
            script = "bash ${config.sops.templates."configure-ip.sh".path}";
            path = with pkgs; [
              bash
              iproute2
            ];
            wantedBy = [ "multi-user.target" ];
            requires = [ "network-online.target" ];
            after = [ "network-online.target" ];
          };

        })
        # (lib.mkIf (config.systemd.network.enable) {
        #   sops.templates = lib.mapAttrs' (name: value: {
        #     name = "configure-ip-for-${name}";
        #     value = ''
        #       [Match]
        #       Name=${name}

        #       [Network]
        #       Address=${value.addr}/${value.mask}
        #       Gateway=${value.gateway}
        #     '';
        #   }) cfg.v4;

        #   environment.etc = lib.mapAttrs' (name: value: {
        #     name = "systemd/network/45-configure-ip-for-${name}.network".source;
        #     value = config.sops.templates."configure-ip-for-${name}".path;
        #   }) cfg.v4;
        # })
        (lib.mkIf (config.systemd.network.enable) {
          sops.templates = lib.mapAttrs' (name: value: {
            name = "configure-ip-for-${name}";
            value = ''
              [Match]
              Name=${name}

              [Network]
              Address=${getValue value.addr}/${getValue value.mask}
              Gateway=${getValue value.gateway}
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
