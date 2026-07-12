{
  description = "不会有人真的看简介吧？ - a flake file for my configurations.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.1.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

    yazi-everforest-medium.url = "github:Chromium-3-Oxide/everforest-medium.yazi";
    yazi-everforest-medium.flake = false;

    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    noctalia.url = "github:noctalia-dev/noctalia";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    plum-nix.url = "github:Lhcfl/plum-nix";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    nix-kdl.url = "github:Lhcfl/nix-kdl";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      lanzaboote,
      home-manager,
      sops-nix,
      ...
    }:
    let
      inherit ((import ./utils/files.nix { inherit nixpkgs; })) listNixFilesRec;
      globals-cfgs = listNixFilesRec ./global;
      modules-cfgs = listNixFilesRec ./modules;
      globals = builtins.concatLists [
        [
          home-manager.nixosModules.home-manager
          sops-nix.nixosModules.sops
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
