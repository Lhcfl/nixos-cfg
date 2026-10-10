{
  pkgs,
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [
      "xhci_pci"
      "thunderbolt"
      "nvme"
      "usbhid"
      "usb_storage"
      "sd_mod"
      "rtsx_pci_sdmmc"
    ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    extraModulePackages = [ ];
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/353db29e-70df-4f30-ab7f-33bfc094112b";
      fsType = "btrfs";
      options = [
        "subvol=@"
        "compress=zstd:3"
      ];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/353db29e-70df-4f30-ab7f-33bfc094112b";
      fsType = "btrfs";
      options = [
        "subvol=@home"
        "compress=zstd:3"
      ];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/7E2C-2BF1";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };
    "/media/c" = {
      device = "/dev/disk/by-uuid/F654E4A954E46E35";
      fsType = "ntfs3";
      options = [ "ro" ];
    };
    "/media/d" = {
      device = "/dev/disk/by-uuid/04374294FD1C96EA";
      fsType = "ntfs3";
      options = [ "ro" ];
    };
    "/media/share" = {
      device = "/dev/disk/by-uuid/6ED9-FBF2";
      fsType = "exfat";
      options = [
        "gid=${toString config.users.groups.wheel.gid}"
        "dmask=002"
        "fmask=113"
      ];
    };
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/8d199324-a195-4f75-98c4-5e9f4e57f4ca"; }
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # The internal display is driven by the Intel iGPU (Alder Lake P). Provide a
  # VA-API driver so browsers (Zen/Firefox) can hardware-decode video.
  # hardware.graphics.extraPackages = [ pkgs.intel-media-driver ];
  # added by nixos-hardware.nixosModules.lenovo-legion-16iah7h

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
