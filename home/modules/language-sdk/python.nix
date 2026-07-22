{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.funkcia.hm.language-sdk.python.enable = lib.mkEnableOption "Enable python SDK";

  config = lib.mkIf config.funkcia.hm.language-sdk.python.enable {
    home.packages = with pkgs; [
      uv # python3
      ty
      ruff # python linter
      # python3
    ];
  };
}
