{
  config,
  inputs,
  ...
}:
{
  systems = [
    "x86_64-linux"
  ];

  perSystem = { pkgs, system, ... }: {
    packages.funkcia-options-doc =
      let
        inherit ((import ../utils/files.nix { lib = inputs.nixpkgs.lib; })) listNixFilesRec;
      in
      inputs.nuschtos-search.packages.${system}.mkMultiSearch {
        title = "Funkcia Options";
        baseHref = "/nixos-cfg/";
        scopes = [
          {
            name = "NixOS Modules";

            modules = builtins.concatLists [
              (listNixFilesRec ../modules)
              (listNixFilesRec ../global)
            ];
            urlPrefix = "https://github.com/Lhcfl/nixos-cfg/blob/main/";

            specialArgs = { inherit inputs; };
          }
          {
            name = "Home Manager Modules";

            modules = builtins.concatLists [
              (listNixFilesRec ../home/modules)
            ];

            urlPrefix = "https://github.com/Lhcfl/nixos-cfg/blob/main/";

            specialArgs = { inherit inputs pkgs; };
          }
        ];
      };
  };
}
