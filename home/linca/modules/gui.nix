{
  inputs,
  lib,
  config,
  pkgs,
  funkcia-utils,
  osConfig,
  ...
}:
let
  cfg = config.funkcia.hm.gui;
in
{
  # 神奇魔法！
  # 给 ./programs/gui 下的 nix 文件统一添加条件 lib.mkIf cfg.enable
  imports = lib.pipe ../gui [
    funkcia-utils.files.listNixFilesRec
    (map (
      funkcia-utils.magic.patchModule (
        _: module: {
          config = lib.mkIf cfg.enable module.config;
        }
      )
    ))
  ];

  config = lib.mkIf cfg.enable {
    funkcia.hm.gui.components.gnome.enable = true;

    services.wl-clip-persist.enable = true;

    home.packages = with pkgs; [
      # noctalia-shell
      telegram-desktop
      gradia # 截图和编辑工具
      wl-clipboard-rs
      element-desktop
      netease-cloud-music-gtk
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
