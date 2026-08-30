{ pkgs, ... }:
{
  # use latest kernel package
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
