{ lib, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless.enable = false;
    # {
    #   enable = true;
    #   setSocketVariable = true;
    # };
    # daemon.settings = {
    #   "registry-mirrors" = [
    #     "https://docker.mirrors.ustc.edu.cn/"
    #   ];
    # };
  };

  environment.systemPackages = with pkgs; [
    docker
  ];

  # systemd.services.docker = {
  #   environment = {
  #     "http_proxy" = lib.mkForce "";
  #     "https_proxy" = lib.mkForce "";
  #     "socks_proxy" = lib.mkForce "";
  #     "socks5_proxy" = lib.mkForce "";
  #     "all_proxy" = lib.mkForce "";
  #   };
  # };
}
