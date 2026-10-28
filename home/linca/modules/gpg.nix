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

        # 私钥口令缓存 2 小时（gpg-agent 默认 10 分钟）
        home.file."${config.programs.gpg.homedir}/gpg-agent.conf".text = ''
          default-cache-ttl 7200
          max-cache-ttl 7200
        '';
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
