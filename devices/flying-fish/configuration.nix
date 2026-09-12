# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  funkcia-utils,
  pkgs,
  ...
}:
{
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ./domain.nix
    ./networking.nix
    ./nocow.nix
    (funkcia-utils.files.mkDirModule ./services)
    (funkcia-utils.files.mkDirModule ./users)
  ];

  networking.hostName = "flying-fish"; # Define your hostname.
  funkcia.os.preset = "server";
  services.openssh.ports = [ 8023 ];

  # 从 kitty/foot/ghostty 等终端 SSH 登录时，远端需要对应的 terminfo 条目，
  # 否则 ncurses 程序会报 “cannot initialize terminal type”。
  # 一次装齐所有常见终端的 terminfo，避免以后换终端又踩坑。
  environment.enableAllTerminfo = true;

  sops = {
    defaultSopsFile = ./secrets.yaml;
    age.keyFile = "/var/lib/age/keys.txt";
  };

  boot.loader.grub = {
    enable = true;
    efiSupport = false;
  };

  # disko 的 mdadm 设备会打开 boot.swraid.enable；mdadm 包里的
  # mdmonitor.service 需要 /etc/mdadm.conf 里有 MAILADDR 或 PROGRAM，
  # 否则 `mdadm --monitor --scan` 会直接失败退出。这里用一个空操作
  # PROGRAM 消除该 warning（RAID0 也没有冗余可监控）。
  # 想真正告警可把 PROGRAM 换成自己的脚本。
  boot.swraid.mdadmConf = "PROGRAM ${pkgs.coreutils}/bin/true";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.11"; # Did you read the comment?
}
