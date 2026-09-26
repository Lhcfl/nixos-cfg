{
  config,
  pkgs,
  lib,
  ...
}:
{
  services.sshd.enable = true;

  networking.firewall.enable = false;

  # Use systemd-resolved inside the container
  # Workaround for bug https://github.com/NixOS/nixpkgs/issues/162686
  networking.useHostResolvConf = lib.mkForce false;
  services.resolved.enable = true;
  system.stateVersion = "26.11";

  users.users.linca = {
    initialPassword = "change-me-now";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwHaPGjtqvGsYrO5NiGHoVMSS/Qj+63hv1QNBG+wnm+ linca@nixos"
    ];
  };
}
