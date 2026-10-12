{
  this,
  pkgs,
  lib,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption ''
      TPM 模块。
      see https://nixos.wiki/wiki/TPM
    '';

    tpm-fido.enable = lib.mkEnableOption "tpm-fido";
  };

  config = lib.mkIf this.config.enable (
    lib.mkMerge [
      {
        # https://nixos.wiki/wiki/TPM
        security.tpm2 = {
          enable = true;
          pkcs11.enable = true; # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
          tctiEnvironment.enable = true; # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
        };
      }

      (lib.mkIf this.config.tpm-fido.enable {
        services.udev.extraRules = ''
          SUBSYSTEM=="misc", KERNEL=="uhid", GROUP="wheel", MODE="0660"
        '';

        environment.systemPackages = with pkgs; [
          pinentry-all
          tpm-fido
        ];
      })
    ]
  );
}
