{
  inputs,
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  # zen browser is big and requires github network access, which is not available in China. So we delay its installation in new CN installation mode.
  config = lib.mkIf (!osConfig.funkcia.os.new-cn-install) {
    home.packages = [
      (inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default)
    ];
  };
}
