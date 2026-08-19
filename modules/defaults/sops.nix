{
  pkgs,
  config,
  lib,
  ...
}:
let
  cfg = config.funkcia.os.sops-support;
in
{
  options.funkcia.os.sops-support = {
    enable = lib.mkEnableOption "sops support. disabling it will disable all sops encryptions" // {
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      age
      sops
    ];
  };
}
