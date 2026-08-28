{ ... }:
{
  perSystem = { pkgs, config, ... }: {
    packages.niri-follow-pip = pkgs.callPackage ./default.nix { };
    overlayAttrs = { inherit (config.packages) niri-follow-pip; };
  };
}
