# Module for enabling Secure Boot with lanzaboote and sbctl.
# Please refer to https://nix-community.github.io/lanzaboote/getting-started/prepare-your-system.html

{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.funkcia.modules.secure-boot = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable Secure Boot module with lanzaboote and sbctl.
      '';
    };
  };

  config = lib.mkIf config.funkcia.modules.secure-boot.enable {

    environment.systemPackages = with pkgs; [
      sbctl
    ];

    # Bootloader.
    boot = {
      # Lanzaboote currently replaces the systemd-boot module.
      # This setting is usually set to true in configuration.nix
      # generated at installation time. So we force it to false
      # for now.
      loader.systemd-boot.enable = lib.mkForce false;

      lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";

        # Keys are generated in a systemd service, so you will need to actually boot
        # the system to generate the keys. They will not be generated as part of
        # switch-to-configuration or nixos-install.
        # https://nix-community.github.io/lanzaboote/how-to-guides/automatically-generate-keys.html
        autoGenerateKeys.enable = true;
        autoEnrollKeys.enable = true;
      };
    };

  };
}
