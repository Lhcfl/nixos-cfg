{
  modulesPath,
  funkcia-utils,
  ...
}:
{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix")
    (funkcia-utils.files.mkDirModule ./modules)
    (funkcia-utils.files.mkDirModule ./users)
  ];

  funkcia.os = {
    presets.cn.enable = true;

    modern-cli-tools.enable = true;
    networking.enable = true;
    sops-support.enable = true;
  };

  hardware.bluetooth.enable = true;

  services.udisks2.enable = true;

  isoImage = {
    configurationName = "funkcia";
    appendToMenuLabel = " (funkcia)";
    makeEfiBootable = true;
    makeUsbBootable = true;
  };
}
