{
  description = "A SecureBoot-enabled NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";

      # Optional but recommended to limit the size of your system closure.
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      lanzaboote,
      home-manager,
      ...
    }:
    let
      globals = [
        # enabled modules
        ./global/boot.nix
        ./global/locale.nix
        ./global/networking.nix
        ./global/services.nix
        ./global/programs.nix
        ./global/nix.nix
        ./global/fonts.nix
        ./global/root.nix

        # default disabled modules
        ./modules/gnome-keyring.nix
        ./modules/docker.nix
        ./modules/fingerprint.nix
        ./modules/hyprland.nix
        ./modules/secure-boot.nix
        ./modules/btrbk.nix
      ];
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = globals ++ [
            lanzaboote.nixosModules.lanzaboote
            home-manager.nixosModules.home-manager
            ./devices/legion-82tf/configuration.nix
            ./home/home-manager.nix
          ];
        };
      };
    };
}
