{ lib, config, ... }: {
  config = lib.mkIf (config.funkcia.os.sops-support.enable) {
    sops = {
      defaultSopsFile = ./secrets.yaml;
      age.keyFile = "/var/lib/age/keys.txt";

      secrets = {
        "cloudflare/email" = { };
        "cloudflare/dns-api-token" = { };
      };
    };
  };
}
