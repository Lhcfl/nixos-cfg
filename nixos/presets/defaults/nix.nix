# Global Nix/Nixpkgs configuration

{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.nix;
in
{
  options.funkcia.nix.lix.enable = lib.mkEnableOption "Lix, a fork of Nix" // {
    default = true;
  };

  config = lib.mkMerge [
    {
      nixpkgs = {
        # Allow unfree packages
        config.allowUnfree = true;

        overlays = [
          (final: prev: {
            funkcia = inputs.self.overlays.default final prev;
          })
        ];
      };

      nix = {
        # 一个 path 失败别把整个 build 拖死
        settings.keep-going = true;

        settings.experimental-features = [
          "nix-command"
          "flakes"
          (lib.mkIf cfg.lix.enable "pipe-operator")
          (lib.mkIf (!cfg.lix.enable) "pipe-operators")
        ];

        gc = {
          automatic = true;
          options = "--delete-older-than 7d";
          dates = "Sun 19:00";
          randomizedDelaySec = "45min";
        };

        # 优化相同文件
        settings.auto-optimise-store = true;
        optimise.automatic = true;

        nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      };
    }

    (lib.mkIf cfg.lix.enable {
      nix.package = pkgs.lixPackageSets.stable.lix;
      nixpkgs.overlays = [
        (final: prev: {
          inherit (prev.lixPackageSets.stable)
            nixpkgs-review
            nix-eval-jobs
            nix-fast-build
            colmena
            ;
        })
      ];
    })

    # my substituter
    {
      nix.settings.substituters = [ "https://lhcfl.cachix.org" ];
      nix.settings.trusted-public-keys = [
        "lhcfl.cachix.org-1:hf4kin1zCbaeLWygZlwhYms/oqB0I8/8ZZsPkezpFms="
      ];
    }

    # nix community
    {
      nix.settings.substituters = [ "https://nix-community.cachix.org" ];
      nix.settings.trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    }
  ];
}
