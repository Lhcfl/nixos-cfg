{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.funkcia.os.secure-boot = {
    enable = lib.mkEnableOption ''
      Secure Boot on your NixOS system using `lanzaboote` and `sbctl`.

      Please refer to https://nix-community.github.io/lanzaboote/getting-started/prepare-your-system.html

      The module has been configured to automatically generate and enroll keys. However,
      i don't know, but if it didn't works, you may need to prepare your system and 
      create the necessary keys manually if you prefer.

      ## PREPARE YOUR SYSTEM

      Exit "User Mode" in your firmware settings, and enable "Setup Mode".

      ```
      sudo sbctl create-keys

      # Expected output:
      # [sudo] password for linca:
      # Created Owner UUID 8ec4b2c3-dc7f-4362-b9a3-0cc17e5a34cd
      # Creating secure boot keys...✓
      # Secure boot keys created!
      ```

      ```
      sudo sbctl enroll-keys

      # enroll the keys into your firmware.
      ```

      ```
      sudo sbctl verify

      # Verify that your system is ready for Secure Boot.
      # Expected output:
      # ✓ /boot/EFI/Boot/bootx64.efi is signed
      # ✓ /boot/EFI/Linux/nixos-generation-66-pexlogtmhjjwua4micjecfr6p6chnd64d4uauxfkishwlcgyauza.efi is signed
      # ✗ /boot/EFI/Microsoft/Boot/zh-TW/memtest.efi.mui is not signed
      # ✗ /boot/EFI/nixos/kernel-6.18.2-otn6nn3tkudhh5xpj5736u2q3h4kjzojd6fkg4rqzdf5l5c7gxuq.efi is not signed
      # ✓ /boot/EFI/systemd/systemd-bootx64.efi is signed
      # It is expected that kernel-xxx and Microsoft files are not signed.
      ```
    '';
  };

  config = lib.mkIf config.funkcia.os.secure-boot.enable {

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
