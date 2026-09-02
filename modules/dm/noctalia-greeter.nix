{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.os.dm.noctalia-greeter = {
    enable = lib.mkEnableOption "noctalia-greeter module, which is a TUI login manager (or display manager).";
  };

  config = lib.mkIf config.funkcia.os.dm.noctalia-greeter.enable {
    services.accounts-daemon.enable = true;

    services.displayManager.noctalia-greeter = {
      enable = true;
      cursorTheme.name = "Bibata-Modern-Ice";
      cursorTheme.package = pkgs.bibata-cursors;
    };

    security.pam.services.noctalia-greeter = {
      enableGnomeKeyring = lib.mkIf config.services.gnome.gnome-keyring.enable true;
    };
  };
}
