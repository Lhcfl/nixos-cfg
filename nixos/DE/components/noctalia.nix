{ this, lib, ... }: {
  this.options = {
    enable = lib.mkEnableOption ''
      Noctalia Shell
    '';
  };

  config = lib.mkIf this.config.enable {
    programs.noctalia.enable = true;
    programs.noctalia.recommendedServices.enable = true;
  };
}
