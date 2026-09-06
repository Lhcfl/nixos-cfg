# use linca.local to access the device on the local network
{ ... }: {
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    hostName = "linca";

    publish.enable = true;
    publish.userServices = true;
  };
}
