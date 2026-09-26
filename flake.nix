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
      misskey-media-proxy,
      nixos-hardware,
      filesystem-modules,
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
          (funkcia-utils.files.mkDirModule ./packages)
        ];

        nixos = {
          sharedModules = [
            self.nixosModules.shared
            self.nixosModules.default
          ];

          devices = {
            legion-82tf.imports = [
              ./devices/legion-82tf/configuration.nix
              nixos-hardware.nixosModules.lenovo-legion-16iah7h
            ];

            dell-workstation.imports = [
              ./devices/dell-workstation/configuration.nix
            ];

            flying-fish.imports = [
              disko.nixosModules.disko
              misskey-media-proxy.nixosModules.default
              ./devices/flying-fish/configuration.nix
            ];
          };
        };

        flake = {
          nixosModules.default = filesystem-modules.mkModule {
            directory = ./nixos;
            base = [
              "funkcia"
              "os"
            ];
          };
          nixosModules.shared = {
            imports = [
              ./home/home-manager.nix
              (funkcia-utils.files.mkRecDirModule ./fixes)
              home-manager.nixosModules.home-manager
              sops-nix.nixosModules.sops
              lanzaboote.nixosModules.lanzaboote
            ];
          };
          homeModules.default = funkcia-utils.files.mkRecDirModule ./home/modules;
        };
      };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    filesystem-modules.url = "github:Lhcfl/filesystem-modules";
    filesystem-modules.inputs.nixpkgs-lib.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.1.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    #nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    #nix-vscode-extensions.inputs.nixpkgs.follows = "nixpkgs";

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
    nuschtos-search.inputs.nix-index-database.follows = "nix-index-database";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    misskey-media-proxy.url = "github:Lhcfl/media-proxy";
    misskey-media-proxy.inputs.nixpkgs.follows = "nixpkgs";
    misskey-media-proxy.inputs.flake-parts.follows = "flake-parts";

    linquebot_rs.url = "github:Lhcfl/Linquebot_rs";

    shell-auto-pi.url = "github:Lhcfl/shell-auto-pi";
    shell-auto-pi.inputs.nixpkgs.follows = "nixpkgs";

    nixos-hardware.url = "github:NixOS/nixos-hardware";
    nixos-hardware.inputs.nixpkgs.follows = "nixpkgs";
  };
}
