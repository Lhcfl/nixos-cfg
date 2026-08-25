{ lib, ... }:
rec {
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

  mkDirModule = path: {
    imports = listNixFiles path;
  };

  mkRecDirModule = path: {
    imports = listNixFilesRec path;
  };

  mkIndexDirModule = suffix: path: {
    imports = (builtins.filter (lib.hasSuffix suffix) (listNixFilesRec path));
  };
}
