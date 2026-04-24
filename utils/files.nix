{ nixpkgs, ... }:
let
  inherit (nixpkgs) lib;
in
{
  listNixFiles =
    path: builtins.filter (x: lib.hasSuffix ".nix" x) (lib.filesystem.listFilesRecursive path);
}
