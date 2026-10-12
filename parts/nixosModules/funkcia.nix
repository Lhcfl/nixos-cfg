{ inputs, funkcia-utils, ... }:
let
  module = inputs.filesystem-modules.mkModule {
    directory = funkcia-utils.projectPath /nixos;
    base = [
      "funkcia"
      "os"
    ];
  };
in
{
  flake.nixosModules = {
    funkcia = module;
    default = module;
  };
}
