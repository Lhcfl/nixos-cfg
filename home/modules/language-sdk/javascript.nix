{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.funkcia.hm.language-sdk.javascript.enable = lib.mkEnableOption "javascript SDK";

  config = lib.mkIf config.funkcia.hm.language-sdk.javascript.enable {
    home.packages = with pkgs; [
      (corepack.override {
        nodejs-slim = nodejs-slim_latest;
      })
      nodejs_latest
      biome
    ];
  };
}
