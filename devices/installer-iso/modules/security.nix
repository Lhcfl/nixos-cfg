{ lib, ... }: {
  security.sudo.enable = lib.mkForce false;
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = lib.mkForce false;
  };
}
