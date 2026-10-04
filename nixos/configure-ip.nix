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
      inherit (lib) types;
    in
    lib.mkOption {
      description = ''
        ${description} 

        可能为机密的值。设置为下列两种值的一种。

        - **明文**：此时直接设置值，比如 `"123.45.67.89"`
        - **密文**：此时设置 `config.sops.placeholder.<key>` 即可
      '';
      type = types.oneOf [
        types.str
      ];
      example = lib.literalExpression "config.sops.placeholder.\"network/ens3/ipv4\"";
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

  config = lib.mkIf cfg.enable (
    lib.mkMerge [
      (lib.mkIf (!config.systemd.network.enable) {
        warnings = [
          "`configure-ip` with `config.systemd.network.enable` = false is not tested"
        ];

        sops.templates."configure-ip.sh".content = lib.pipe cfg.v4 [
          lib.attrsToList
          (map (
            { name, value }:
            ''
              nmcli connection modify "${name}" \
                ipv4.method manual \
                ipv4.addresses ${value.addr}/${value.mask} \
                ipv4.gateway "" \
                ipv4.routes "0.0.0.0/0 ${value.gateway} onlink=true" \
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

      (lib.mkIf config.systemd.network.enable {
        sops.templates = lib.flip lib.mapAttrs' cfg.v4 (
          name: value: {
            name = "configure-ip-for-${name}";
            # systemd-networkd 以非特权用户运行，模板默认 0400 会导致其无法读取
            value.mode = "0644";
            # 模板变化后重新加载 networkd
            value.restartUnits = [ "systemd-networkd.service" ];
            value.content = lib.generators.toINI { } {
              Match.Name = name;
              Network.Address = "${value.addr}/${value.mask}";
              Network.Gateway = value.gateway;
            };
          }
        );

        environment.etc = lib.mapAttrs' (name: value: {
          name = "systemd/network/45-configure-ip-for-${name}.network";
          value.source = config.sops.templates."configure-ip-for-${name}".path;
        }) cfg.v4;
      })
    ]
  );
}
