{ this, lib, ... }: {
  this.options = {
    enable = lib.mkEnableOption ''
      Niri, A scrollable-tiling Wayland compositor.
    '';
  };

  config = lib.mkIf this.config.enable {
    programs.niri.enable = true;

    funkcia.os.DE = {
      isWayland = true;
      settings.keyring.enable = lib.mkDefault true;
    };
  };
}
