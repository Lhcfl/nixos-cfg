{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.funkcia.os.modern-cli-tools.enable =
    lib.mkEnableOption ''
      现代化的 CLI 工具，包括 fzf, ripgrep 等
    ''
    // {
      default = true;
    };

  config = lib.mkIf config.funkcia.os.modern-cli-tools.enable {
    programs.zoxide.enable = true;
    programs.bat.enable = true;

    environment.systemPackages = with pkgs; [
      nvd # nix diff
      eza # `ls` replacement
      fd # `find` replacement
      ripgrep # `grep` replacement
      zoxide # `cd` replacement
      helix # `vim` replacement
      fzf # fuzzy finder
      gdu # better `du`
      btop # better htop
    ];
  };
}
