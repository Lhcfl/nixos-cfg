{
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.funkcia.os.preset == "pc") {
    funkcia.os = lib.mkDefault {
      secure-boot.enable = true;
      tpm.enable = true;
      nix-mirrors.enable = true;
      gui = {
        enable = true;
        niri.enable = true;
      };
      dm.noctalia-greeter.enable = true;
    };

    services.displayManager.sddm.settings = lib.mkDefault {
      General = {
        GreeterEnvironment = "QT_WAYLAND_SHELL_INTEGRATION=layer-shell,QT_SCALE_FACTOR=1.5";
      };
    };

    services.accounts-daemon.enable = lib.mkDefault true;
    services.blueman.enable = lib.mkDefault true;
    services.flatpak.enable = lib.mkDefault true;

    programs.steam.enable = lib.mkDefault true;

    hardware.bluetooth = lib.mkDefault {
      enable = true;
      powerOnBoot = true;
    };
  };
}
