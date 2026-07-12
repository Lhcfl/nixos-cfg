{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ nix-output-monitor ];

  programs.nh = {
    enable = true;
  };
}
