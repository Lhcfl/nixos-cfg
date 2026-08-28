{
  description = ''
    不会有人真的看简介吧？ - a flake file for my configurations.
  '';

  outputs =
    inputs@{
      self,
      flake-parts,
      nixpkgs,
      lanzaboote,
      home-manager,
      sops-nix,
      disko,
      ...
    }:
    let
      funkcia-utils = {
        projectPath = path: ./. + path;
        files = import ./utils/files.nix { inherit (nixpkgs) lib; };
        magic = import ./utils/magic.nix { inherit (nixpkgs) lib; };
      };
    in
    inputs.flake-parts.lib.mkFlake
      {
        inherit inputs;
        specialArgs = { inherit funkcia-utils; };
      }
      {
        imports = [
          flake-parts.flakeModules.easyOverlay
          (funkcia-utils.files.mkRecDirModule ./parts)
          (funkcia-utils.files.mkIndexDirModule "index.nix" ./packages)
        ];

        nixos = {
          sharedModules = [
            ./home/home-manager.nix
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            lanzaboote.nixosModules.lanzaboote
            self.nixosModules.default
          ];

          devices = {
            legion-82tf.imports = [
              ./devices/legion-82tf/configuration.nix
            ];

            flying-fish.imports = [
              ./devices/flying-fish/configuration.nix
            ];

            datapasa-vps-2.imports = [
              disko.nixosModules.disko
              ./devices/datapasa-vps-2/configuration.nix
            ];
          };
        };

        flake = {
          nixosModules.default = funkcia-utils.files.mkRecDirModule ./modules;
          homeModules.default = funkcia-utils.files.mkRecDirModule ./home/modules;
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

    nuschtos-search.url = "github:NuschtOS/search";
    nuschtos-search.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };
}
