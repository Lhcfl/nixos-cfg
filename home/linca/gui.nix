{
  lib,
  utils,
  config,
  pkgs,
  ...
}:
{
  options.funkcia.hm.gui = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable GUI packages";
    };
  };

  imports = (utils.files.listNixFiles ./gui/modules) ++ [
    ./gui/vscode/vscode.nix # 还没写完
    ./gui/packages.nix
  ];

  config = lib.mkIf config.funkcia.hm.gui.enable {
    home.packages = with pkgs; [
      noctalia-shell
      zed-editor
      # mako # notifcation
      telegram-desktop
      # BEGIN 截图
      gradia
      grim
      slurp
      wl-clipboard-rs
      # END 截图
      onedriver
      vscode
      qq
      # wechat
      thunderbird
      gparted
      element-desktop
      opencode
    ];

    programs.keepassxc = {
      enable = true;
    };
  };
}
