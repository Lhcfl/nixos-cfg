{ ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;

    settings = {
      server.host-name = "linca-workstation";

      publish.disable-publishing = false;
      publish.disable-user-service-publishing = false;
    };
  };
}
