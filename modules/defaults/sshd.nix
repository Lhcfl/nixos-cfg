{ lib, config, ... }:
{
  services.openssh.settings = (lib.mapAttrs (_: lib.mkDefault)) {
    PermitRootLogin = "no";
    PasswordAuthentication = false;
    KbdInteractiveAuthentication = false;
  };
}
