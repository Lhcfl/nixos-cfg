{
  inputs,
  lib,
  config,
  pkgs,
  utils,
  ...
}:
let
  cfg = config.funkcia.hm.gui;
in
{
  # 神奇魔法！
  # 给 ./programs/gui 下的 nix 文件统一添加条件 lib.mkIf cfg.enable
  imports = lib.pipe ./programs/gui [
    utils.files.listNixFiles
    (map (
      utils.magic.patchModule (
        _: module: {
          config = lib.mkIf cfg.enable module.config;
        }
      )
    ))
  ];

  options.funkcia.hm.gui = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GUI packages";
    };

    preset = lib.mkOption {
      type = lib.types.enum [
        "kde"
        "gnome"
      ];
      default = "gnome";
      description = "Choose a desktop environment preset to install related packages.";
    };
  };

  config = lib.mkIf config.funkcia.hm.gui.enable {
    home.packages = with pkgs; [
      # noctalia-shell
      telegram-desktop

      # BEGIN 截图
      gradia
      grim
      slurp
      # END 截图

      wl-clipboard-rs
      qq
      element-desktop
      (inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default)

      libreoffice
    ];

    # home.file = {
    #   ".local/bin/start-gnome-polkit" = {
    #     source = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    #   };
    # };

    programs = {
      zed-editor.enable = true;

      vscode.enable = true;

      chromium.enable = true;

      obsidian.enable = true;

      noctalia.enable = true;

      # bitwarden 更好
      # keepassxc.enable = true;

      firefox.enable = true;

      thunderbird.enable = true;
    };
  };
}
