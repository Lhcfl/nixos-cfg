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

    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-cli = {
      url = "github:nix-community/nixos-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      lanzaboote,
      home-manager,
      nix-vscode-extensions,
      nixos-cli,
      ...
    }:
    let
      globals = [
        nixos-cli.nixosModules.nixos-cli
        home-manager.nixosModules.home-manager

        # enabled modules
        ./global/boot.nix
        ./global/locale.nix
        ./global/networking.nix
        ./global/services.nix
        ./global/programs.nix
        ./global/nix.nix
        ./global/fonts.nix
        ./global/root.nix
        ./global/security.nix

        # default disabled modules
        ./modules/gnome-keyring.nix
        ./modules/docker.nix
        ./modules/fingerprint.nix
        ./modules/hyprland.nix
        ./modules/secure-boot.nix
        ./modules/btrbk.nix
        ./modules/tpm.nix
        ./modules/nix-mirrors.nix
        ./modules/laptop.nix
      ];
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          # system = "x86_64-linux";
          # ignore the system parameter because it is deprecated

          specialArgs = {
            inherit inputs;
          };

          modules = globals ++ [
            lanzaboote.nixosModules.lanzaboote
            ./devices/legion-82tf/configuration.nix
            ./home/home-manager.nix
          ];
        };
      };
    };
}
