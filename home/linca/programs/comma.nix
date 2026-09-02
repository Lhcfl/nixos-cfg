{
  inputs,
  lib,
  osConfig,
  ...
}:
{
  imports = [ inputs.nix-index-database.homeModules.default ];
  config = lib.mkIf (!osConfig.funkcia.os.new-cn-install) {
    programs.nix-index-database.comma.enable = true;
    programs.nix-index.enable = true;
  };
}
