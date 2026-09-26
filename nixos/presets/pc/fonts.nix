{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.funkcia.os.fonts.enable = lib.mkEnableOption "字体相关设置" // {
    default = true;
  };

  config = lib.mkIf config.funkcia.os.fonts.enable {
    fonts = {
      # when set to true, causes some "basic" fonts to be installed for reasonable
      # Unicode coverage. Set to true if you are unsure about what languages
      # you might end up reading.
      enableDefaultPackages = true;

      # create a directory with links to all fonts in /run/current-system/sw/share/X11/fonts.
      fontDir.enable = true;

      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        source-han-sans
        source-han-serif
        source-serif
        source-serif-pro
      ];

      fontconfig.enable = true;
      fontconfig.defaultFonts = {
        # Sans serif fonts: prefer Western fonts, then CJK variants
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK SC"
          "Noto Sans CJK TC"
          "Noto Sans CJK JP"
          "Noto Sans CJK KR"
          "Noto Color Emoji"
        ];

        # Serif fonts: prefer Western fonts, then CJK variants
        serif = [
          "Noto Serif"
          "Noto Serif CJK SC"
          "Noto Serif CJK TC"
          "Noto Serif CJK JP"
          "Noto Serif CJK KR"
          "Noto Color Emoji"
        ];

        # Monospace fonts: Maple Mono for programming, fallback to Noto Sans Mono
        monospace = [
          "Maple Mono NF CN"
          "Noto Sans Mono"
          "Noto Color Emoji"
        ];

        # Emoji font
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };

    programs.steam.fontPackages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
    ];
  };
}
