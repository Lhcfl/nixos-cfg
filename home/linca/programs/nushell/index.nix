{ ... }:
{
  programs.nushell.enable = true;
  programs.nushell.extraConfig = ''
    use ${./from-nix.nu} *
  '';
}
