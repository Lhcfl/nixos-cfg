{ inputs, ... }:
let
  kdl = inputs.nix-kdl.kdl;
in
{
  programs.zellij.enable = true;
  programs.zellij.extraConfig =
    with kdl.dsl;
    kdl.formats.v1 [
      (n "theme_dark" "default")
      (n "theme_light" "default")
      (n "default_mode" "locked")
      (n "terminal" [
        (n "font" "Maple Mono NF CN")
        (n "font_size" 11)
      ])
    ];
}
