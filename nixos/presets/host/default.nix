{ config, lib, ... }:
let
  cfg = config.funkcia.os.presets.host;
in
{
  imports = [
    ./btrfs-tools.nix
    ./programs.nix
    ./security.nix
    ./shell.nix
    ./system.nix
    ./collect-user.nix
    ./modern-cli-tools.nix
    ./root.nix
    ./services.nix
    ./sops.nix
  ];

  options.funkcia.os.presets.host = {
    enable = lib.mkEnableOption "该系统是一台主机";
  };

  config = lib.mkIf cfg.enable {
    # TODO
  };
}
