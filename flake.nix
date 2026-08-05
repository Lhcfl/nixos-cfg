{
  description = ''
    不会有人真的看简介吧？ - a flake file for my configurations.
  '';

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

      # make a nixos system with extra modules
      mkNixosSystem =
        extraModules:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = builtins.concatLists [
            [
              ./home/home-manager.nix
              home-manager.nixosModules.home-manager
              sops-nix.nixosModules.sops
            ]
            (listNixFilesRec ./global)
            (listNixFilesRec ./modules)
            extraModules
          ];
        };
    in
    {
      nixosConfigurations = {

        legion-82tf = mkNixosSystem [
          lanzaboote.nixosModules.lanzaboote
          ./devices/legion-82tf/configuration.nix
        ];

      };

      # checks the nixos top level
      # checks.x86_64-linux.<hostname>TopLevel = self.nixosConfigurations.<hostname>.config.system.build.toplevel;
      checks.x86_64-linux.legion-82tfTopLevel =
        self.nixosConfigurations.legion-82tf.config.system.build.toplevel;
    };

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
}
