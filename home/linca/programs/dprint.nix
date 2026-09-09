# dprint is a formatter
{ lib, config, ... }: {
  programs.dprint = lib.mkIf config.linca.work.enable {
    enable = true;

    settings = {
      excludes = [ ];
      markdown = {
        lineWidth = 80;
        textWrap = "always";
        wrapUnspacedScripts = true;
      };
      plugins = [
        "npm:@dprint/markdown@0.23.3"
      ];
    };
  };
}
