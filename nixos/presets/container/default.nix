{ config, lib, ... }:
let
  cfg = config.funkcia.os.presets.container;
in
{
  options.funkcia.os.presets.container = {
    enable = lib.mkEnableOption "该系统是一个容器";
  };

  config = lib.mkIf cfg.enable {
    # TODO
  };
}
