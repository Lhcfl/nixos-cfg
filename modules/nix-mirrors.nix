{ config, lib, ... }:
{
  options.funkcia.os.nix-mirrors = {
    enable = lib.mkEnableOption "适用于中国地区的 nix mirror";
  };

  config = lib.mkIf config.funkcia.os.nix-mirrors.enable {
    nix.settings.substituters = [
      "https://mirror.nju.edu.cn/nix-channels/store"
      # "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"
    ];
  };
}
