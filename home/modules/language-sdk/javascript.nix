{
  lib,
  pkgs,
  this,
  config,
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
      programs.bun = {
        enable = true;
        settings.install = lib.mkMerge [
          {
            # Install packages once. Every project links to the same copy.
            # https://bun.com/docs/pm/global-store
            globalStore = true;
            # linker = "isolated"; # but don't enable this, will cause bug for global bun install
          }
          (lib.mkIf config.xdg.enable {
            globalDir = "${config.xdg.dataHome}/bun/install/global";
            globalBinDir = "${config.xdg.binHome}";
            cache = "${config.xdg.cacheHome}/bun/install/cache";
          })
        ];
      };
    })
    (lib.mkIf this.config.nodejs.enable {
      home.packages = with pkgs; [
        pnpm
        nodejs_latest
      ];
    })
  ];
}
