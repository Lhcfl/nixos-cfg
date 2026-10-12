{ lib, ... }: {
  mkDirModule = path: {
    imports = lib.pipe (builtins.readDir path) [
      lib.attrsToList
      (builtins.filter ({ name, value }: (lib.hasSuffix ".nix" name) || (value == "directory")))
      (map ({ name, ... }: name))
      (map (x: path + /${x}))
    ];
  };
}
