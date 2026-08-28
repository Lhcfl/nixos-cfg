{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.linca.work.enable) {
    home.packages = with pkgs; [
      pi-coding-agent
    ];
  };
}
