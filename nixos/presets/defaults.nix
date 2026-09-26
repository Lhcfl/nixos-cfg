{ this, lib, ... }: {
  this.options.enable = lib.mkEnableOption "全局默认值" // {
    default = true;
  };

  config = lib.mkIf this.config.enable {
    funkcia.os.presets.defaults = {
      locale.enable = true;
      security.enable = true;
    };
    funkcia.os.networking.enable = true;
    fonts.fontDir.enable = true;

    services.journald.settings.Journal = {
      SystemMaxUse = "1G";
    };
  };
}
