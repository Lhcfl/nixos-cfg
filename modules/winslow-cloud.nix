# TODO
{ config, lib, ... }:
{
  options.funkcia.os.winslow-cloud.enable = lib.mkEnableOption "winslow-cloud";

  config = lib.mkIf config.funkcia.os.winslow-cloud.enable (
    lib.mkMerge [
      {
        security.krb5.enable = true;

        security.krb5.settings = {
          # libdefaults = {
          # default_realm = "WINSLOW.CLOUD";
          # dns_lookup_realm = true;
          # rdns = false;
          # dns_canonicalize_hostname = false;
          # dns_lookup_kdc = true;
          # ticket_lifetime = "24h";
          # forwardable = true;
          # udp_preference_limit = 0;
          # default_ccache_name = "KEYRING:persistent:%{uid}";
          # permitted_enctypes = "aes256-cts-hmac-sha384-192 aes128-cts-hmac-sha256-128 aes256-cts-hmac-sha1-96 aes128-cts-hmac-sha1-96 camellia256-cts-cmac camellia128-cts-cmac";
          # spake_preauth_groups = "edwards25519";
          # };
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

        services.tailscale = {
          enable = true;

          extraUpFlags = [
            "--login-server=https://hellonavi.winslow.cloud"
            "--accept-routes"
            "--accept-dns=false"
          ];
        };

        # to accept dns, i have to make networking.resolvconf false
        # networking.resolvconf.enable = false;
        # services.resolved.enable = true;
      }

      # when nftables
      (lib.mkIf config.networking.nftables.enable {
        # 1. Enable the service and the firewall
        networking.firewall = {
          enable = true;
          # Always allow traffic from your Tailscale network
          trustedInterfaces = [ config.services.tailscale.interfaceName ];
          # Allow the Tailscale UDP port through the firewall
          allowedUDPPorts = [ config.services.tailscale.port ];
        };

        # 2. Force tailscaled to use nftables (Critical for clean nftables-only systems)
        # This avoids the "iptables-compat" translation layer issues.
        systemd.services.tailscaled.serviceConfig.Environment = [
          "TS_DEBUG_FIREWALL_MODE=nftables"
        ];

        # 3. Optimization: Prevent systemd from waiting for network online
        # (Optional but recommended for faster boot with VPNs)
        systemd.network.wait-online.enable = false;
        boot.initrd.systemd.network.wait-online.enable = false;
      })
    ]
  );
}
