{
  lib,
  this,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "shell 相关设置";

  config = lib.mkIf this.config.enable {
    programs = {
      # better shell
      fish.enable = true;
      zsh.enable = true;
      zoxide.enable = true;
      starship.enable = true;
      starship.presets = [
        "plain-text-symbols"
      ];
    };
  };
}
