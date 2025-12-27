{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gnome-keyring
    libsecret
  ];

  services.gnome.gnome-keyring.enable = true;

  # security.pam.services.<yourDisplayManager>.enableGnomeKeyring = true;
}
