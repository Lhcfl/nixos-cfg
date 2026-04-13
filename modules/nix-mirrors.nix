{ config, lib, ... }:
{
  options.funkcia.modules.nix-mirrors = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable Nix mirror configuration.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.nix-mirrors.enable {
    nix.settings.substituters = [
      "https://mirror.nju.edu.cn/nix-channels/store"
    ];
  };
}
