# use linca.local to access the device on the local network
{ ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;

    settings = {
      server.host-name = "linca";

      publish.disable-publishing = false;
      publish.disable-user-service-publishing = false;
    };
  };
}
