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

        可能为机密的值。设置为下列两种值的一种。

        - **明文**：此时直接设置值，比如 `"123.45.67.89"`

        - **密文**：此时设置 secret = key，比如，如果 `config.sops.placeholder.key-name` 是对应了 `"123.45.67.89"` 的 sops，则设置为：

        ```nix
        { secret = "key-name"; }
        ```
      '';
      type = types.oneOf [
        types.str
        (types.submodule {
          options.secret = lib.mkOption { type = types.str; };
        })
      ];
      example = {
        secret = "key-name";
      };
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
            addr = maybeSecretOption "IPv4 地址。例如 123.45.67.89";
            mask = maybeSecretOption "子网掩码。例如 32";
            gateway = maybeSecretOption "网关, 例如 1.2.3.4";
          };
        }
      );
    };
  };

  config =
    let
      mkPlaceholder = x: "<SOPS:${builtins.hashString "sha256" x.secret}:PLACEHOLDER>";

      getValue = x: if x ? "secret" then mkPlaceholder x else x;
    in
    lib.mkIf cfg.enable (
      lib.mkMerge [
        {
          sops.placeholder = lib.pipe cfg.v4 [
            lib.attrsToList
            (builtins.concatMap (
              { value, ... }:
              let
                gen =
                  key:
                  (lib.mkIf (value.${key} ? "secret") { "${value.${key}.secret}" = mkPlaceholder value.${key}; });
              in
              [
                (gen "addr")
                (gen "mask")
                (gen "gateway")
              ]
            ))
            lib.mkMerge
          ];
        }

        (lib.mkIf (!config.systemd.network.enable) {
          sops.templates."configure-ip.sh".content = lib.pipe cfg.v4 [
            lib.attrsToList
            (map (
              { name, value }:
              ''
                nmcli connection modify "${name}" \
                  ipv4.method manual \
                  ipv4.addresses ${getValue value.addr}/${getValue value.mask} \
                  ipv4.gateway "" \
                  ipv4.routes "0.0.0.0/0 ${getValue value.gateway} onlink=true" \
                  ipv4.never-default no \
                  connection.autoconnect yes
              ''
            ))
            (builtins.concatStringsSep "\n")
            (x: "set +e\n${x}\ntrue") # todo: ip addr add 可能重复而忽略错误；或许有什么改善方法？
          ];

          systemd.services."configure-ip" = {
            script = "bash ${config.sops.templates."configure-ip.sh".path}";
            path = with pkgs; [
              bash
              networkmanager
            ];
            wantedBy = [ "network.target" ];
            after = [ "NetworkManager.service" ];
          };
        })

        (lib.mkIf (config.systemd.network.enable) {
          sops.templates = lib.pipe cfg.v4 [
            lib.attrsToList
            (map (
              { name, value }: {
                "configure-ip-for-${name}".content = ''
                  [Match]
                  Name=${name}

                  [Network]
                  Address=${getValue value.addr}/${getValue value.mask}
                  Gateway=${getValue value.gateway}
                '';
              }
            ))
            lib.mkMerge
          ];

          environment.etc = lib.mapAttrs' (name: value: {
            name = "systemd/network/45-configure-ip-for-${name}.network";
            value.source = config.sops.templates."configure-ip-for-${name}".path;
          }) cfg.v4;
        })
      ]
    );
}
