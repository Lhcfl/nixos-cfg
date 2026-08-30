{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.funkcia.hm.modern-cli-tools.enable = lib.mkEnableOption ''
    现代化的 CLI 工具，包括 fzf, ripgrep 等

    - zoxide 替换 cd
    - bat 替换 cat
    - eza 替换 ls
    - fzf 作为 fuzzy finder
    - fd 替换 find
    - rg 替换 grep
    - fish 作为 interactive shell
  '';

  config = lib.mkIf config.funkcia.hm.modern-cli-tools.enable {
    # 自动使得所有 shellIntergration 生效
    home.shell.enableShellIntegration = true;

    programs.zoxide.enable = true; # replace cd

    programs.fish.enable = true; # user friendly shell

    programs.starship.enable = true; # shell prompts

    programs.eza = {
      # replace ls
      enable = true;
      icons = "auto";
      colors = "auto";
    };

    programs.bat.enable = true;

    programs.fzf.enable = true;

    programs.fd.enable = true;

    programs.ripgrep.enable = true;

    # programs.atuin.enable = true;
  };
}
