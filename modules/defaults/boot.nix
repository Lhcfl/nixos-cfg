{ pkgs, ... }:
{
  boot = {
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
