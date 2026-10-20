{ lib, config, ... }:
let
  mapDomains = f: lib.mapAttrs' (_: f) config.funkcia.os.domains;
in
{
  funkcia.os.domain.suffix = "${
    builtins.concatStringsSep "l" [
      "ste"
      "po"
      "va"
    ]
  }.moe";

  sops.secrets = {
    "cloudflare/email" = { };
    "cloudflare/dns-api-token" = { };
  };

  sops.templates."security-acme-envfile".content = ''
    CF_API_EMAIL=${config.sops.placeholder."cloudflare/email"}
    CF_DNS_API_TOKEN=${config.sops.placeholder."cloudflare/dns-api-token"}
  '';

  security.acme = {
    acceptTerms = true;

    defaults = {
      dnsProvider = "cloudflare";
      environmentFile = config.sops.templates."security-acme-envfile".path;

      email = "lhcfl@outlook.com";
    };
  };

  services.nginx.virtualHosts = mapDomains (domain: {
    name = domain.value;

    value = {
      forceSSL = true;
      enableACME = true;

      listen = [
        {
          addr = "0.0.0.0";
          port = 443;
          ssl = true;
        }
      ];
    };
  });

  security.acme.certs = mapDomains (domain: {
    name = domain.value;

    value = {
      dnsProvider = "cloudflare";
      webroot = lib.mkForce null;
    };
  });
}
