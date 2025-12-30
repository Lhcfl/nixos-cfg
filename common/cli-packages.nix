{ pkgs, ... }:
with pkgs;
[
  eza # `ls` replacement
  fd # `find` replacement
  ripgrep # `grep` replacement
  zoxide # `cd` replacement
  helix # `vim` replacement
  fzf # fuzzy finder
  git
  bat # `cat` replacement
  bun # js runtime
  lon # nix package manager
  unzip
  p7zip # 7z
  manix # nix configuration helper
  gdu # better `du`
  btop # better htop
  htop
]
