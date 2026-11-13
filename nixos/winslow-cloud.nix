{
  config,
  lib,
  pkgs,
  this,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "connection to winslow's cloud";
    krb5.enable = lib.mkEnableOption "kerberos client for winslow's cloud" // {
      default = true;
    };

    krb5.ccacheName = lib.mkOption {
      type = lib.types.str;
      default = "FILE:/run/user/%{uid}/krb5cc";
      description = ''
        `default_ccache_name` for krb5.conf.

        The default keeps tickets in the per-user tmpfs runtime directory:
        it is 0700, cleared on reboot, and does not leave stale files behind
        in /tmp. Use `KEYRING:persistent:%{uid}` for kernel-keyring backed
        ccache (what ipa-client-install picks), or `KCM:%{uid}` when a kcm
        daemon is running.
      '';
    };
  };

  config = lib.mkIf this.config.enable (
    lib.mkMerge [
      {
        assertions = [
          {
            assertion = config.services.resolved.enable;
            message = ''
              winslow's cloud requires you to enable systemd-resolved, since tailscale needs to accept dns
            '';
          }
        ];

        services.tailscale = {
          enable = true;

          useRoutingFeatures = "client";

          extraUpFlags = [
            "--login-server=https://hellonavi.winslow.cloud"
            "--accept-routes"
            "--accept-dns=true"
          ];
        };

        systemd.services.tailscaled.serviceConfig.Environment =
          lib.mkIf (config.networking.nftables.enable)
            [
              "TS_DEBUG_FIREWALL_MODE=nftables"
            ];
      }

      (lib.mkIf this.config.krb5.enable {
        security.krb5.enable = true;

        # nixpkgs builds openssh without GSSAPI by default, so ssh would
        # reject `GSSAPIAuthentication yes` as an unsupported option.
        programs.ssh.package = pkgs.openssh.override {
          withKerberos = true;
        };

        security.krb5.settings = {
          libdefaults = {
            default_realm = "WINSLOW.CLOUD";
            dns_lookup_realm = true;
            rdns = false;
            dns_canonicalize_hostname = false;
            dns_lookup_kdc = true;
            ticket_lifetime = "24h";
            forwardable = true;
            udp_preference_limit = 0;
            default_ccache_name = this.config.krb5.ccacheName;
            # NOTE: ipa-client-install also sets these, but MIT krb5's defaults
            # already negotiate both, so they are only needed if preauth fails.
            # permitted_enctypes = "aes256-cts-hmac-sha384-192 aes128-cts-hmac-sha256-128 aes256-cts-hmac-sha1-96 aes128-cts-hmac-sha1-96 camellia256-cts-cmac camellia128-cts-cmac";
            # spake_preauth_groups = "edwards25519";
          };
          realms = {
            "WINSLOW.CLOUD" = {
              default_domain = "winslow.cloud";
              auto_fast_armor = true;
            };
          };
          domain_realm = {
            ".winslow.cloud" = "WINSLOW.CLOUD";
            "winslow.cloud" = "WINSLOW.CLOUD";
            "hellolain.romulus.winslow.cloud" = "WINSLOW.CLOUD";
            "memantine.client.winslow.cloud" = "WINSLOW.CLOUD";
            ".client.winslow.cloud" = "WINSLOW.CLOUD";
            "client.winslow.cloud" = "WINSLOW.CLOUD";
          };
        };
      })
    ]
  );
}
