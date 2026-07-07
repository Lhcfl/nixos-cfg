# { config, lib, ... }:
_: {
  # options.funkcia.hm.opencode.enable = lib.mkEnableOption "enable opencode";
  # config = lib.mkIf config.funkcia.hm.opencode.enable {
  # };

  programs.opencode = {
    enable = true;
    settings = {
      plugin = [ "superpowers@git+https://github.com/obra/superpowers.git" ];
    };
    tui = {
      theme = "system";
    };
  };
}
