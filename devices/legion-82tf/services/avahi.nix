# use linca.local to access the device on the local network
{ ... }: {
  services.avahi = {
    enable = true;

    # nss-mdns is the resolution path for .local names; systemd-resolved cannot
    # resolve this host's own records (avahi ignores queries whose source is a
    # local address).
    nssmdns4 = true;
    nssmdns6 = true;

    settings = {
      server.host-name = "linca";

      publish.publish-addresses = true;
      publish.disable-publishing = false;
      publish.disable-user-service-publishing = false;
    };
  };

  # avahi must remain the only mDNS responder. With the current default (full
  # responder enabled) systemd-resolved answers on port 5353 too, and avahi
  # then probe-conflicts and renames itself to linca-2.local / linca-3.local.
  services.resolved.settings.Resolve = {
    MulticastDNS = "resolve";
  };
}
