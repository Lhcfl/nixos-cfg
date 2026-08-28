{ ... }:
{
  programs.nushell.enable = true;
  programs.nushell.extraConfig = ''
    use ${../assets/from-nix.nu} *
  '';
}
