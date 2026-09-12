{ lib, config, ... }: {
  config.funkcia.server.domain.suffix = "${
    builtins.concatStringsSep "l" [
      "ste"
      "po"
      "va"
    ]
  }.moe";

  config.sops.secrets = {
    "cloudflare/email" = { };
    "cloudflare/dns-api-token" = { };
  };

  config.sops.templates."security-acme-envfile".content = ''
    CF_API_EMAIL=${config.sops.placeholder."cloudflare/email"}
    CF_DNS_API_TOKEN=${config.sops.placeholder."cloudflare/dns-api-token"}
  '';

  config.security.acme = {
    acceptTerms = true;

    defaults = {
      dnsProvider = "cloudflare";
      environmentFile = config.sops.templates."security-acme-envfile".path;

      email = "lhcfl@outlook.com";
    };
  };

  config.services.nginx.virtualHosts = lib.pipe config.funkcia.server.domains [
    lib.attrsToList
    (map (
      { value, ... }:
      let
        domain = value.value;
      in
      {
        "${domain}" = {
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
      }
    ))
    lib.mkMerge
  ];

  config.security.acme.certs = lib.pipe config.funkcia.server.domains [
    lib.attrsToList
    (map (
      { value, ... }:
      let
        domain = value.value;
      in
      {
        ${domain} = {
          dnsProvider = "cloudflare";
          webroot = lib.mkForce null;
        };
      }
    ))
    lib.mkMerge
  ];
}
