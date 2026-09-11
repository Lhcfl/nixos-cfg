{ config, ... }: {
  sops.secrets.chtholly = {
    format = "binary";
    sopsFile = ./chtholly-config;
  };

  services.xray.enable = true;
  services.xray.settingsFile = config.sops.secrets.chtholly.path;
}
