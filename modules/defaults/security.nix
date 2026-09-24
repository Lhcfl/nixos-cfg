_: {
  security = {
    sudo-rs.enable = true;

    polkit = {
      enable = true;
      enablePkexecWrapper = true; # without this, pkexec will report "setuid must be root"
    };
  };
}
