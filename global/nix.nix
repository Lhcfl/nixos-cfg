# Global Nix/Nixpkgs configuration

{ inputs, pkgs, ... }:
{
  nixpkgs = {
    # Allow unfree packages
    config.allowUnfree = true;

    overlays = [
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
    # nix configuration
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # https://github.com/NixOS/nixpkgs/blob/nixos-25.11/nixos/modules/services/misc/nix-gc.nix
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
      dates = "Sun 19:00";
      randomizedDelaySec = "45min";
    };

    # lix!
    package = pkgs.lixPackageSets.stable.lix;

    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };
}
