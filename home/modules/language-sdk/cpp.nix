{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.funkcia.hm.language-sdk.cpp.enable = lib.mkEnableOption "Enable cpp SDK";

  config = lib.mkIf config.funkcia.hm.language-sdk.cpp.enable {
    home.packages = with pkgs; [
      gcc
      llvmPackages.clang-tools
    ];
  };
}
