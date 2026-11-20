# https://github.com/nix-community/NUR
{ inputs, ... }: {
  flake.nixosModules.nur = {
    nixpkgs.overlays = [ inputs.nur.overlays.default ];
  };
}
