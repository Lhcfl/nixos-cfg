{ config, lib, ... }:
{
  options.funkcia.os.tpm = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        funkcia: Enable TPM module.
      '';
    };
  };

  config = lib.mkIf config.funkcia.os.tpm.enable {

    # https://nixos.wiki/wiki/TPM
    security.tpm2 = {
      enable = true;
      pkcs11.enable = true; # expose /run/current-system/sw/lib/libtpm2_pkcs11.so
      tctiEnvironment.enable = true; # TPM2TOOLS_TCTI and TPM2_PKCS11_TCTI env variables
    };
  };
}
