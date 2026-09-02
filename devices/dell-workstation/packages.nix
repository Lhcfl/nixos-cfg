{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    btdu
  ];
}
