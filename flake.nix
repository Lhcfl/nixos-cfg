{
  description = ''
    不会有人真的看简介吧？ - a flake file for my configurations.
  '';

  outputs =
    inputs@{
      flake-parts,
      nixpkgs,
      lanzaboote,
      home-manager,
      sops-nix,
      ...
    }:
    let
      inherit ((import ./utils/files.nix { lib = nixpkgs.lib; })) listNixFilesRec;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = builtins.concatLists [
        (listNixFilesRec ./parts)
      ];

      nixos = {
        sharedModules = builtins.concatLists [
          [
            ./home/home-manager.nix
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
          ]
          (listNixFilesRec ./global)
          (listNixFilesRec ./modules)
        ];

        devices = {
          legion-82tf.imports = [
            ./devices/legion-82tf/configuration.nix
            lanzaboote.nixosModules.lanzaboote
          ];
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

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

    plum-nix.url = "github:Lhcfl/plum-nix";

    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    nix-kdl.url = "github:Lhcfl/nix-kdl";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    nuschtos-search = {
      url = "github:NuschtOS/search";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
