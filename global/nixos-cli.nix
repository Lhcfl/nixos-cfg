_: {
  programs.nixos-cli = {
    enable = true;
    option-cache.exclude = [ "funkcia" ];
  };
}
