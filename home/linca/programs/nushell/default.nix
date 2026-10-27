{ ... }:
{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      use ${./from-nix.nu} *
      source ${./fish-completer.nu}
      source ${./menu.nu}
    '';
    loadSessionVariables = true;
  };
}
