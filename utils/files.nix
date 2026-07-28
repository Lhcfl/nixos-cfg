{ nixpkgs, ... }:
let
  inherit (nixpkgs) lib;
in
{
  listNixFilesRec =
    path:
    lib.pipe path [
      lib.filesystem.listFilesRecursive
      (builtins.filter (lib.hasSuffix ".nix"))
    ];

  listNixFiles =
    path:
    lib.pipe path [
      builtins.readDir
      builtins.attrNames
      (builtins.filter (lib.hasSuffix ".nix"))
      (map (x: path + /${x}))
    ];
}
