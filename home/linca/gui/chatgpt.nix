{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.funkcia.hm.gui.enable {
    home.packages = with pkgs; [
      llm-agents.chatgpt
    ];
  };
}
