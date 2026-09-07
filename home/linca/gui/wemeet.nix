{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.linca.work.enable {
    home.packages = with pkgs; [
      wemeet
    ];
  };
}
