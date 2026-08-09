{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.funkcia.hm.language-sdk.nix.enable = lib.mkEnableOption "nix SDK";

  config = lib.mkIf config.funkcia.hm.language-sdk.nix.enable {
    home.packages = with pkgs; [
      statix # nix lsp
      nil # nix lsp
      nixd # nix lsp
      nixfmt
    ];
  };
}
