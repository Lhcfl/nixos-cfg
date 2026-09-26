{ lib, ... }: {
  services = {
    # use chrony instead of timesyncd for better time synchronization
    chrony.enable = true;
    timesyncd.enable = false;

    openssh.settings = (lib.mapAttrs (_: lib.mkDefault)) {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };

    journald.settings.Journal = {
      SystemMaxUse = "1G";
    };
  };
}
