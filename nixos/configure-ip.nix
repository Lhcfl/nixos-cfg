{
  lib,
  config,
  options,
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
    if options.sops or null == null then
      {
        assertions = [
          {
            assertion = false;
            message = "You must import sops to configure-ip!";
          }
        ];
      }
    else
      {
        assertions = [
          {
            assertion = config.systemd.network.enable;
            message = "`funkcia.os.configure-ip.enable` requires `sops-nix`. Please import sops-nix.";
          }
        ];

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
      }
  );
}
