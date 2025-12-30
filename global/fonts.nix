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
      hanazono # 花园明朝，覆盖了几乎所有的汉字
    ];

    fontconfig.defaultFonts = {
      sansSerif = [
        "Noto Sans"
        "Noto Sans CJK SC"
        "Noto Sans CJK TC"
        "Noto Sans CJK JP"
        "Noto Sans CJK KR"
        "Noto Color Emoji"
        "HanaMinA"
        "HanaMinB"
      ];

      serif = [
        "Noto Serif"
        "Noto Serif CJK SC"
        "Noto Serif CJK TC"
        "Noto Serif CJK JP"
        "Noto Serif CJK KR"
        "Noto Color Emoji"
        "HanaMinA"
        "HanaMinB"
      ];

      monospace = [
        "Maple Mono NF CN"
        "Noto Sans Mono"
        "Noto Color Emoji"
      ];

      emoji = [
        "Noto Color Emoji"
      ];
    };
  };
}
