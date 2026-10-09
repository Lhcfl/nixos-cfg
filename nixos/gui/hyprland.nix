{
  config,
  lib,
  ...
}:
{
  options.funkcia.os.gui.hyprland = {
    enable = lib.mkEnableOption ''
      Hyprland and related settings.
    '';
  };

  config = lib.mkIf config.funkcia.os.gui.hyprland.enable {
    programs.hyprland.enable = true;
    funkcia.os.gui.isWayland = true;
    funkcia.os.keyring.enable = lib.mkDefault true;
  };
}
