{ ... }: {
  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };

    polkit = {
      enable = true;
      enablePkexecWrapper = true; # without this, pkexec will report "setuid must be root"
    };

    auditd.enable = true;
  };
}
