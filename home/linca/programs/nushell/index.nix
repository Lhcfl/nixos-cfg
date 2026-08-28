{ ... }:
{
  programs.nushell.enable = true;
  programs.nushell.extraConfig = ''
    use ${./from-nix.nu} *
    source ${./fish-completer.nu}
    source ${./menu.nu}
  '';
}
