# Global Nix/Nixpkgs configuration

{ inputs, pkgs, ... }:
{
  nixpkgs = {
    # Allow unfree packages
    config.allowUnfree = true;

    overlays = [
      (final: prev: {
        funkcia = inputs.self.overlays.default final prev;
      })

      (final: prev: {
        inherit (prev.lixPackageSets.stable)
          nixpkgs-review
          nix-eval-jobs
          nix-fast-build
          colmena
          ;
      })
    ];
  };

  nix = {
    settings = {
      keep-going = true; # 一个 path 失败别把整个 build 拖死

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # my substituter
      substituters = [
        "https://lhcfl.cachix.org"
      ];

      trusted-public-keys = [
        "lhcfl.cachix.org-1:hf4kin1zCbaeLWygZlwhYms/oqB0I8/8ZZsPkezpFms="
      ];
    };

    # https://github.com/NixOS/nixpkgs/blob/nixos-25.11/nixos/modules/services/misc/nix-gc.nix
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      dates = "Sun 19:00";
      randomizedDelaySec = "45min";
    };

    # use lix
    package = pkgs.lixPackageSets.stable.lix;

    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}
