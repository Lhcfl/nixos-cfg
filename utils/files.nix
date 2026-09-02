{ lib, ... }:
rec {
  listNixFilesRec =
    path:
    lib.pipe path [
      lib.filesystem.listFilesRecursive
      (builtins.filter (lib.hasSuffix ".nix"))
    ];

  mkDirModule = path: {
    imports = lib.pipe (builtins.readDir path) [
      lib.attrsToList
      (builtins.filter ({ name, value }: (lib.hasSuffix ".nix" name) || (value == "directory")))
      (map ({ name, ... }: name))
      (map (x: path + /${x}))
    ];
  };

  mkRecDirModule = path: {
    imports = listNixFilesRec path;
  };
}
