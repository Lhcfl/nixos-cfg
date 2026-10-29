{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    lenovo-legion
  ];
}
