let
  flake = builtins.getFlake (toString ../..);
  inherit (flake.inputs) nixpkgs;
  lib = nixpkgs.lib;
  pkgs = import nixpkgs { system = "x86_64-linux"; };
in
(lib.evalModules {
  modules = [
    ({ ... }: { _module.args = { inherit pkgs lib; }; })
    <input-file>
  ];
}).config
