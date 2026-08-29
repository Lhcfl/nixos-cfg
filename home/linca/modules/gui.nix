{
  inputs,
  lib,
  config,
  pkgs,
  funkcia-utils,
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

    home.packages = with pkgs; [
      # noctalia-shell
      telegram-desktop

      # BEGIN 截图
      gradia
      grim
      slurp
      # END 截图

      wl-clipboard-rs
      element-desktop
      (inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default)

      netease-cloud-music-gtk
    ];

    programs = {
      zed-editor.enable = true;

      vscode.enable = true;

      chromium.enable = true;

      obsidian.enable = true;

      firefox.enable = true;

      thunderbird.enable = true;
    };
  };
}
