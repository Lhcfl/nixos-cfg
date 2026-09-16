{ config, pkgs, ... }:
let
  keyDir = "/var/lib/nix-serve";
  secretKeyFile = "${keyDir}/secret.key";
  publicKeyFile = "${keyDir}/public.key";
  cacheKeyName = "dell-workstation-1";
in
{
  # 私钥不进仓库：首次启动时生成一次，之后复用。
  # 必须独立成一个 oneshot：nix-serve 的 LoadCredential 在 ExecStart 之前读取密钥，
  # 放在 preStart 里来不及。
  systemd.services.nix-serve-keygen = {
    description = "Generate the nix-serve binary cache signing key";

    # 密钥已存在时整台 unit 直接跳过
    unitConfig.ConditionPathExists = "!${secretKeyFile}";

    before = [ "nix-serve.service" ];
    requiredBy = [ "nix-serve.service" ];

    path = [
      config.nix.package
      pkgs.coreutils
    ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };

    script = ''
      install -d -m 0700 ${keyDir}
      nix-store --generate-binary-cache-key ${cacheKeyName} ${secretKeyFile} ${publicKeyFile}
    '';
  };

  services.nix-serve = {
    enable = true;
    package = pkgs.nix-serve-ng;
    openFirewall = true;
    secretKeyFile = secretKeyFile;
  };
}
