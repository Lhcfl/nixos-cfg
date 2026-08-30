{ config, lib, ... }:
{
  options.funkcia.os.nix-mirrors = {
    enable = lib.mkEnableOption "适用于中国地区的 nix mirror";
  };

  config = lib.mkIf config.funkcia.os.nix-mirrors.enable {
    nix.settings.substituters = [
      # https://help.mirrors.cernet.edu.cn/nix-channels/
      # 自动选择
      "https://mirrors.cernet.edu.cn/nix-channels/store"
    ];
  };
}
