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

    preset = lib.mkOption {
      type = lib.types.enum [
        "kde"
        "gnome"
      ];
      default = "gnome";
      description = "Choose a desktop environment preset to install related packages.";
    };
  };

  imports = (utils.files.listNixFiles ./gui/modules) ++ [
    ./gui/vscode/vscode.nix # 还没写完
  ];

  config = lib.mkIf config.funkcia.hm.gui.enable {
    home.packages = with pkgs; [
      noctalia-shell
      zed-editor
      telegram-desktop

      # BEGIN 截图
      gradia
      grim
      slurp
      wl-clipboard-rs
      # END 截图

      vscode
      qq
      element-desktop
      opencode
      polkit_gnome
    ];

    home.file = {
      ".local/bin/start-gnome-polkit" = {
        source = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      };
    };

    programs = {
      keepassxc.enable = true;
      firefox.enable = true;
      thunderbird.enable = true;
    };

    xdg.mimeApps = {
      enable = true;

      defaultApplications = {
        "application/pdf" = [ "org.mozilla.firefox.desktop" ];
      };
    };
  };
}
