{ config, lib, ... }: {
  options.linca.gpg.pk.enable = lib.mkEnableOption ''
    当这台机器上有自己 ../trust/linca.pk.asc 对应的私钥的时候启用
  '';

  config =
    let
      fingerprint = "951477AAB2DF9ECCCB6AFA5BC4DDAFEAF1BD73A6";
    in
    lib.mkMerge [
      {
        programs.gpg = {
          enable = true;
          publicKeys = [
            {
              source = ../trust/linca.pk.asc;
              trust = "ultimate";
            }
          ];
        };
      }

      (lib.mkIf config.linca.gpg.pk.enable {
        programs.gpg.settings = {
          default-key = fingerprint;
          encrypt-to = fingerprint;
          default-recipient-self = true;
        };

        programs.git = {
          signing.key = fingerprint;
          signing.signByDefault = true;
        };
      })
    ];
}
