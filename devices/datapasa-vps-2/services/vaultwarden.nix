{ lib, config, ... }:
let
  domain = config.flying-fish.prefix-domain "vw";
in
{
  flying-fish.domains = [ domain ];

  services.vaultwarden = {
    domain = domain;
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
