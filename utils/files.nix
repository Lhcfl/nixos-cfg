{ nixpkgs, ... }:
let
  inherit (nixpkgs) lib;
in
{
  listNixFilesRec =
    path: builtins.filter (x: lib.hasSuffix ".nix" x) (lib.filesystem.listFilesRecursive path);
}
