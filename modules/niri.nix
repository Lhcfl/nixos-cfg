{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.funkcia.modules.niri = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable niri module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.niri.enable {
    programs.niri.enable = true;
  };
}
