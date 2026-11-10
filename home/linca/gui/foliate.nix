# epub reader
{ config, lib, ... }: {
  config = lib.mkIf (config.funkcia.hm.gui.enable && config.linca.play.enable) {
    programs.foliate.enable = true;
    funkcia.hm.xdg.mime.defaultApplications.ebookFormats = [
      "com.github.johnfactotum.Foliate.desktop"
    ];
  };
}
