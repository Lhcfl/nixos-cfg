{ config, lib, pkgs, ... }: {
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

        # 已知上游问题：https://github.com/nix-community/home-manager/issues/6067
        # importGpgKeys 在开机激活时（此时没有 XDG_RUNTIME_DIR）会拉起
        # gpg-agent/keyboxd。激活服务退出后这些守护进程会残留在
        # system.slice 中，其中 keyboxd 一直占着 pubring.db 的锁，导致
        # 登录后 gpg 卡在 "waiting for lock"。上游暂无修复，这里按 issue
        # 里的建议在导入完成后把它们杀掉，让用户会话按需启动干净的实例。
        home.activation.cleanupGpgDaemons =
          lib.hm.dag.entryAfter [ "importGpgKeys" ] ''
            run ${pkgs.gnupg}/bin/gpgconf --homedir "${config.programs.gpg.homedir}" --kill all || true
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
