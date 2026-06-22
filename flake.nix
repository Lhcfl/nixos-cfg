{
  description = "不会有人真的看简介吧？ - a flake file for my configurations.";

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

    yazi-everforest-medium = {
      url = "github:Chromium-3-Oxide/everforest-medium.yazi";
      flake = false;
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      lanzaboote,
      home-manager,
      nixos-cli,
      ...
    }:
    let
      inherit ((import ./utils/files.nix { inherit nixpkgs; })) listNixFiles;
      globals-cfgs = listNixFiles ./global;
      modules-cfgs = listNixFiles ./modules;
      globals = builtins.concatLists [
        [
          nixos-cli.nixosModules.nixos-cli
          home-manager.nixosModules.home-manager
        ]
        globals-cfgs
        modules-cfgs
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

      # checks the nixos top level
      checks.x86_64-linux.nixosTopLevel = self.nixosConfigurations.nixos.config.system.build.toplevel;
    };
}
