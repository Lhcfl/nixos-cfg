_: {
  # List services that you want to enable:
  services = {
    # use chrony instead of timesyncd for better time synchronization
    chrony.enable = true;
    timesyncd.enable = false;
  };
}
