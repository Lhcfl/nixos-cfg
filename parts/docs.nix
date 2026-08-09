{
  self,
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
        urlPrefix = "https://github.com/Lhcfl/nixos-cfg/blob/main/";
      in
      inputs.nuschtos-search.packages.${system}.mkMultiSearch {
        title = "Funkcia Options";
        baseHref = "/nixos-cfg/";
        scopes = [
          {
            inherit urlPrefix;
            name = "NixOS Modules";
            modules = [ self.nixosModules.default ];
            specialArgs = { inherit inputs; };
          }
          {
            inherit urlPrefix;
            name = "Home Manager Modules";
            modules = [ self.homeModules.default ];
            specialArgs = { inherit inputs pkgs; };
          }
        ];
      };
  };
}
