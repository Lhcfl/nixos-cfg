{
  lib,
  config,
  pkgs,
  osConfig,
  ...
}:
let
  cfg = config.funkcia.hm.gui;
in
{
  config = lib.mkIf cfg.enable {
    funkcia.hm.gui.components.gnome.enable = true;

    home.pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    services.wl-clip-persist.enable = true;

    home.packages = with pkgs; [
      # noctalia-shell
      telegram-desktop
      gradia # 截图和编辑工具
      wl-clipboard-rs
      element-desktop
      netease-cloud-music-gtk
      zen-browser
      gparted
    ];

    programs = {
      zed-editor.enable = true;

      vscode.enable = true;

      chromium.enable = true;

      obsidian.enable = lib.mkIf (!osConfig.funkcia.os.new-cn-install) true;

      firefox.enable = true;

      thunderbird.enable = true;
    };

    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
    };
  };
}
