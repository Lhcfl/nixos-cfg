# dell-workstation-new 的硬件配置
#
# 磁盘布局由 install.sh 完整负责（分区 + bcache + btrfs），
# 这里只声明最终挂载结果。分区标签和 bcache label 都是固定字符串，
# 与 install.sh 中的常量一一对应。
#
#   nvme0n1p1   1G    ESP              -> /boot
#   nvme0n1p2  16G    swap
#   nvme0n1p3  剩余    bcache cache
#   sda1       931G    bcache backing
#   /dev/bcache0 -> btrfs (@root/@home/@nix)
{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usb_storage"
    "usbhid"
    "sd_mod"
    "sr_mod"
    # 根在 /dev/bcache0 上，initrd 必须能加载 bcache 并组装设备
    "bcache"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-intel"
    "bcache"
  ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/bcache/by-label/data";
    fsType = "btrfs";
    options = [
      "subvol=@root"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/bcache/by-label/data";
    fsType = "btrfs";
    options = [
      "subvol=@home"
      "compress=zstd"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/bcache/by-label/data";
    fsType = "btrfs";
    options = [
      "subvol=@nix"
      "compress=zstd"
      "noatime"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/dell-esp";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partlabel/dell-swap";
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
