{ pkgs, ... }: {
  i18n.inputMethod.fcitx5 = {
    waylandFrontend = true;

    addons = with pkgs; [
      fcitx5-rime
      fcitx5-gtk
      kdePackages.fcitx5-qt
    ];

    settings.inputMethod = {
      "Groups/0" = {
        Name = "default";
        "Default Layout" = "us";
        "DefaultIM" = "rime";
      };
      "Groups/0/Items/0" = {
        Name = "keyboard-us";
        Layout = "";
      };
      "Groups/0/Items/1" = {
        Name = "rime";
        Layout = "";
      };
      GroupOrder = {
        "0" = "Default";
      };
    };

    settings.addons.classicui.globalSection = {
      Theme = "plasma";
      DarkTheme = "plasma";
      UseDarkTheme = true;
    };
  };
}
