_: {
  # List services that you want to enable:
  services = {
    blueman.enable = true;

    # Configure keymap in X11
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
      # libinput = {
      #   touchpad.naturalScrolling = false;
      # };
    };

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

  };
}
