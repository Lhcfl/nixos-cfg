_: {
  # List services that you want to enable:
  services = {
    # faster new tech
    dbus.implementation = "broker";

    # use chrony instead of timesyncd for better time synchronization
    chrony.enable = true;
    timesyncd.enable = false;
  };
}
