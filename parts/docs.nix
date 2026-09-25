{
  self,
  inputs,
  funkcia-utils,
  lib,
  ...
}:

{
  systems = [
    "x86_64-linux"
  ];

  perSystem =
    { pkgs, system, ... }:
    let
      urlPrefix = "https://github.com/Lhcfl/nixos-cfg/blob/main/";

      mkUserModule = name: {
        inherit urlPrefix;
        name = "User Modules for ${name}";
        modules = [ ../home/${name}/home.nix ];
        specialArgs = {
          inherit inputs pkgs funkcia-utils;
          osConfig = null;
        };
      };

      list = [
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
        (mkUserModule "linca")
      ];
    in
    {
      packages.funkcia-options-doc = inputs.nuschtos-search.packages.${system}.mkMultiSearch {
        title = "Funkcia Options";
        baseHref = "/nixos-cfg/";
        hashLocation = true;
        scopes = list;
      };

      packages.funkcia-options-doc-md =
        let
          replacer = [
            {
              from = "file://" + (toString (funkcia-utils.projectPath "/")) + "/";
              to = urlPrefix;
            }
            {
              from = funkcia-utils.projectPath "/";
              to = "";
            }
          ];

          genMarkdown =
            {
              name,
              modules,
              specialArgs,
              ...
            }:
            lib.pipe
              {
                modules = modules ++ [
                  { _module.check = false; }
                ];
                inherit specialArgs;
              }
              [
                lib.evalModules
                (x: x.options)
                (lib.attrsets.filterAttrs (k: _: k != "_module"))
                (
                  options:
                  pkgs.nixosOptionsDoc {
                    inherit options;
                    warningsAreErrors = false;
                  }
                )
                (x: ''
                  echo "# ${name}" >> $out
                  cat ${x.optionsCommonMark} >> $out
                '')
              ];
        in
        pkgs.runCommand "docs.md" { } ''
          ${builtins.concatStringsSep "\n" (map genMarkdown list)}
          substituteInPlace $out ${
            lib.concatMapStrings (
              { from, to }: "--replace-fail ${lib.escapeShellArg from} ${lib.escapeShellArg to} "
            ) replacer
          }
        '';
    };
}
