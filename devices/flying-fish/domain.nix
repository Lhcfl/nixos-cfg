{ lib, config, ... }: {
  options.flying-fish = {
    prefix-domain = lib.mkOption {
      type = lib.types.raw;
    };

    domains = lib.mkOption {
      type = lib.types.listOf lib.types.str;
    };
  };

  config.flying-fish.prefix-domain = name: "${name}.placeholder.com";

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

  config.services.nginx.virtualHosts = lib.mkMerge (
    map (domain: {
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
    }) config.flying-fish.domains
  );

  config.security.acme.certs = lib.mkMerge (
    map (domain: { ${domain} = { }; }) config.flying-fish.domains
  );
}
