{ lib, pkgs, ... }: {
  funkcia.os.networking.enable = true;

  networking = {
    firewall.enable = lib.mkForce false;
    networkmanager.enable = true;
  };

  programs.clash-verge.enable = true;

  environment.systemPackages = with pkgs; [
    xray
    v2ray
    v2rayn
    v2ray-rules-dat
  ];
}
