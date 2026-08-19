{ pkgs, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
