{ ... }: {
  programs.nushell.enable = true;
  programs.nushell.extraConfig = ''
    source ${../assets/from-nix.nu}
  '';
}
