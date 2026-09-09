{ ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    hostName = "linca-workstation";

    publish.enable = true;
    publish.userServices = true;
  };
}
