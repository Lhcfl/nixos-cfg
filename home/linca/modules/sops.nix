{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
{
  options.linca.sops.enable = lib.mkEnableOption "SOPS configs" // {
    default = true;
  };

  config = lib.mkIf ((osConfig.funkcia.os.sops-support.enable or true) && config.linca.sops.enable) {
    home.packages = with pkgs; [
      age
      sops
    ];

    sops = {
      defaultSopsFile = ./secrets.yaml;
      age.keyFile = "/var/lib/age/keys.txt";
      defaultSymlinkPath = "${config.xdg.stateHome}/sops-nix/secrets";
    };

    home.sessionVariables.SOPS_AGE_KEY_FILE = config.sops.age.keyFile;
  };
}
