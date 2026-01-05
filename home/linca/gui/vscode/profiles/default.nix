{ pkgs, lib, ... }:
{
  userSettings = {
    "editor.fontSize" = 13;
    "editor.fontFamily" = "Maple Mono NF CN";
    "editor.fontLigatures" = true;
    "terminal.integrated.fontSize" = 13;
    "terminal.integrated.defaultProfile.linux" = "fish";
    "terminal.integrated.stickyScroll.enabled" = false;
    "github.copilot.nextEditSuggestions.enabled" = true;
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nixd"; # or "nixd"; or ["executable"; "argument1"; ...]
    # LSP config can be passed via the ``nix.serverSettings.{lsp}`` as shown below.
    "nix.serverSettings" = {
      # check https:#github.com/oxalica/nil/blob/main/docs/configuration.md for all options available
      "nil" = {
        # "diagnostics" = {
        #  "ignored" = ["unused_binding"; "unused_with"];
        # };
        "formatting" = {
          "command" = [
            "nixfmt"
          ];
        };
      };
      # check https:#github.com/nix-community/nixd/blob/main/nixd/docs/configuration.md for all nixd config
      "nixd" = {
        "formatting" = {
          "command" = [
            "nixfmt"
          ];
        };
      };
    };
  };
  extensions = [ ];
}
