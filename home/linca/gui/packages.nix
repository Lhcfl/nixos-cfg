{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.funkcia.hm.gui.enable {
    home.packages = with pkgs; [
      zed-editor
      # mako # notifcation
      telegram-desktop
      # BEGIN 截图
      gradia
      grim
      slurp
      wl-clipboard-rs
      # END 截图
      # BEGIN hyprland
      hypridle # hyprland tools
      hyprlock # hyprland tools
      # END hyprland
      onedriver
      vscode
      qq
      wechat
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
