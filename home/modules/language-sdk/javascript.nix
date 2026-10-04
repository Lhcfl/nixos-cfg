{
  lib,
  pkgs,
  this,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption "javascript/typescript SDK";
    bun.enable = lib.mkEnableOption "bun runtime" // {
      default = this.config.enable;
    };
    nodejs.enable = lib.mkEnableOption "nodejs runtime" // {
      default = this.config.enable;
    };
  };

  config = lib.mkMerge [
    (lib.mkIf this.config.enable {
      home.packages = with pkgs; [
        biome
      ];
    })
    (lib.mkIf this.config.bun.enable {
      programs.bun.enable = true;
      home.sessionPath = [
        "$HOME/.bun/bin/"
      ];
    })
    (lib.mkIf this.config.nodejs.enable {
      home.packages = with pkgs; [
        pnpm
        nodejs_latest
      ];
    })
  ];
}
