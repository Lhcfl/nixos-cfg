{ ... }: {
  services.openssh.settings.AllowUsers = [ "root" ];
  services.openssh.settings.AllowGroups = [ "wheel" ];
}
