{
  lib,
  pkgs,
  this,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "python SDK";

  config = lib.mkIf this.config.enable {
    home.packages =
      let
        wrapuv =
          name:
          pkgs.writeShellApplication {
            inherit name;
            text = "exec uv run ${name} \"$@\"";
          };
      in
      with pkgs;
      [
        uv # python3
        ty # python typechecker
        ruff # python linter
        (wrapuv "python")
        (wrapuv "python3")
        (wrapuv "pip")
      ];
  };
}
