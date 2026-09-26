{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.os.gui.fonts;
in
{
  options.funkcia.os.gui.fonts = {
    enable = lib.mkEnableOption "启用 GUI 时的额外字体包";
  };

  config = lib.mkIf cfg.enable {
    fonts = {
      packages = with pkgs; [
        nerd-fonts.liberation
        maple-mono.NF-CN-unhinted
        lxgw-wenkai-screen
        hanazono # 花园明朝，覆盖了几乎所有的汉字
        lxgw-wenkai
        lxgw-wenkai-screen
      ];

      fontconfig.defaultFonts = {
        # fallback to HanaMin if no other font is available
        sansSerif = lib.mkAfter [
          "HanaMinA"
          "HanaMinB"
        ];
        serif = lib.mkAfter [
          "HanaMinA"
          "HanaMinB"
        ];
      };
    };
  };
}
