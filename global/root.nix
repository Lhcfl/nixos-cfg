{ pkgs, ... }:
{
  programs = {
    zsh.enable = true;
    zoxide.enable = true;
    starship.enable = true;
    starship.presets = [
      "plain-text-symbols"
    ];
  };

  users.users.root = {
    shell = pkgs.zsh;
  };
}
