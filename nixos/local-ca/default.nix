{
  config,
  lib,
  options,
  ...
}:
let
  cfg = config.funkcia.os.local-ca;
in
{
  options.funkcia.os.local-ca = {
    enable = lib.mkEnableOption "自签名";
    keyPath = lib.mkOption {
      type = lib.types.str;
      visible = false;
    };
    crtPath = lib.mkOption {
      type = lib.types.str;
      visible = false;
    };
  };

  config = lib.mkIf cfg.enable (
    if options ? sops then
      {
        users.groups.funkcia-local-ca = { };

        sops.secrets."local-ca-root-key" = {
          format = "binary";
          mode = "0440";
          sopsFile = ./root.key.secret;
          group = "funkcia-local-ca";
        };

        funkcia.os.local-ca.keyPath = config.sops.secrets."local-ca-root-key".path;
        funkcia.os.local-ca.crtPath = toString ./root.crt;
        security.pki.certificateFiles = [ ./root.crt ];
      }
    else
      throw "local-ca requirs sops"
  );
}
