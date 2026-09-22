{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.funkcia.os.displayManager.noctalia-greeter;
in
{
  options.funkcia.os.displayManager.noctalia-greeter = {
    enable = lib.mkEnableOption "noctalia-greeter module, which is a TUI login manager (or display manager).";
  };

  config = lib.mkIf cfg.enable {
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
