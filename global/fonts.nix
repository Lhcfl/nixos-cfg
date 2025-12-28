{ pkgs, ... }:
{
  fonts = {
    # when set to true, causes some "basic" fonts to be installed for reasonable
    # Unicode coverage. Set to true if you are unsure about what languages
    # you might end up reading.
    enableDefaultPackages = true;

    packages = with pkgs; [
      maple-mono.NF-CN-unhinted
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      lxgw-wenkai-screen
    ];
  };
}
