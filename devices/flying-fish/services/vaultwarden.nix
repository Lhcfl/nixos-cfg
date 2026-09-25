{ lib, config, ... }:
let
  domain = config.funkcia.os.domains.vw.value;
in
{
  funkcia.os.domains.vw = { };

  services.vaultwarden = {
    inherit domain;
    enable = true;
    configureNginx = true;
    dbBackend = "sqlite";
    config = {
      SIGNUPS_ALLOWED = false;
    };
  };

  virtualisation.vmVariant = {
    services.nginx.virtualHosts."${domain}" = {
      forceSSL = lib.mkForce false;
      enableACME = lib.mkForce false;
    };
  };
}
