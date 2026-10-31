{ this, lib, ... }: {
  this.options = {
    enable = lib.mkEnableOption ''
      Umbriel, the compositor by Noctalia team
    '';
  };

  config = lib.mkIf this.config.enable {
    programs.umbriel.enable = true;

    funkcia.os.DE = {
      isWayland = true;
      settings.keyring.enable = lib.mkDefault true;
    };
  };
}
