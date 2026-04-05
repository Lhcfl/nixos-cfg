_: {
  # List services that you want to enable:
  services = {
    blueman.enable = true;

    # Enable the OpenSSH daemon.
    openssh = {
      enable = true;
      ports = [ 8322 ];
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [ "linca" ];
      };
    };

    # flatpak support
    flatpak.enable = true;

    # faster new tech
    dbus.implementation = "broker";

    # use chrony instead of timesyncd for better time synchronization
    chrony.enable = true;
    timesyncd.enable = false;
  };
}
