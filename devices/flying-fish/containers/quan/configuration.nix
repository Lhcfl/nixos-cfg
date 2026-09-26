{
  config,
  pkgs,
  lib,
  ...
}:
{
  funkcia.os.presets.container.enable = true;

  services.sshd.enable = true;
  networking.firewall.enable = lib.mkForce false;
  system.stateVersion = "26.11";

  users.users.linca = {
    isNormalUser = true;
    initialPassword = "change-me-now";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwHaPGjtqvGsYrO5NiGHoVMSS/Qj+63hv1QNBG+wnm+ linca@nixos"
    ];
  };

  services.openssh.settings.AllowUsers = [ "linca" ];
}
