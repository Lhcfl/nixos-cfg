{ pkgs, vscode-exts, ... }:
{
  userSettings = {
    "github.copilot.nextEditSuggestions.enabled" = true;
    "terminal.integrated.stickyScroll.enabled" = false;
    "editor.fontFamily" = "Maple Mono NF CN";
    "editor.fontSize" = 13;
    "chat.viewSessions.orientation" = "stacked";
    "[typescript]" = {
      "editor.defaultFormatter" = "biomejs.biome";
    };
  };
  extensions = with vscode-exts.vscode-marketplace; [
    dbaeumer.vscode-eslint
    bradlc.vscode-tailwindcss
    lokalise.i18n-ally
    biomejs.biome
    blazejkustra.react-compiler-marker
  ];
}
