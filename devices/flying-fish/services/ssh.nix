{ ... }: {
  services.openssh = {
    enable = true;
    ports = [ 8322 ];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = [ "root" ];
    };
  };
}
