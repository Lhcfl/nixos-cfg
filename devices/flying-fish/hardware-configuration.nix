# funkcia.server.的硬件配置。
# 由 nixos-generate-config 在该机原本的 Ubuntu 上生成，
# 已去掉 fileSystems / swapDevices / boot.swraid（这些由 disko 的 disk-config.nix 负责）。
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "uhci_hcd"
    "xen_blkfront"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
