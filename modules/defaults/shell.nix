{ ... }:
{
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
}
