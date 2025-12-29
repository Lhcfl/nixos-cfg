{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.modules.docker = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable Docker module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.docker.enable {
    virtualisation.docker = {
      enable = true;
      storageDriver = "btrfs";
      rootless.enable = false;
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
  };
}
