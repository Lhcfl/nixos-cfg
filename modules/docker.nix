_: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  services.docker = {
    enable = true;

    daemon.settings = {
      "registry-mirrors" = [
        "https://docker.mirrors.ustc.edu.cn/"
      ];
    };
  };

  systemd.services.docker = {
    environment = {
      "HTTP_PROXY" = "";
      "HTTPS_PROXY" = "";
      "SOCKS_PROXY" = "";
      "SOCKS5_PROXY" = "";
      "ALL_PROXY" = "";
    };
  };
}
