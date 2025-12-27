# Global Nix/Nixpkgs configuration

_: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # nix configuration
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # https://github.com/NixOS/nixpkgs/blob/nixos-25.11/nixos/modules/services/misc/nix-gc.nix
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
      dates = "Sun 19:00";
      randomizedDelaySec = "45min";
    };
  };
}
