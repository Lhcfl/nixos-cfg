{
  lib,
  config,
  ...
}:
{
  options.funkcia.os.presets.cn.enable = lib.mkEnableOption "这台机器是 CN 机器";

  config = lib.mkIf config.funkcia.os.presets.pc.enable {
    nix.settings.substituters = [
      "https://mirrors.cernet.edu.cn/nix-channels/store" # cernet 自动选择 nix channels
    ];
  };
}
