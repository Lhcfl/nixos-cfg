{
  lib,
  pkgs,
  this,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "python SDK";

  config = lib.mkIf this.config.enable {
    home.packages = with pkgs; [
      uv # python3
      ty # python typechecker
      ruff # python linter
    ];

    # add shell aliases so agents can use python
    home.shellAliases = {
      python = "uv run python";
      python3 = "uv run python3";
      pip = "uv run pip";
    };
  };
}
