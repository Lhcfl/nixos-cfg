{
  lib,
  config,
  ...
}:
let
  cfg = config.funkcia.os.user;
in
{
  options.funkcia.os.user = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          ssh-login.enable = lib.mkEnableOption "SSH login";
          is-admin = lib.mkEnableOption "admin priviledge";
        };
      }
    );
  };

  config.users.users = lib.pipe cfg [
    lib.attrsToList
    (map (
      { name, value }:
      {
        ${name} = lib.mkMerge [
          {
            isNormalUser = true;
            description = "user ${name}";
            initialPassword = "change-this-password-after-login";
          }

          (lib.mkIf value.ssh-login.enable {
            openssh.authorizedKeys.keys = [
              "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwHaPGjtqvGsYrO5NiGHoVMSS/Qj+63hv1QNBG+wnm+ linca@nixos"
            ];
          })

          (lib.mkIf value.is-admin {
            extraGroups = [
              "networkmanager"
              "wheel"
              "docker"
              "tss" # tss group has access to TPM devices
            ];
          })
        ];
      }
    ))
    lib.mkMerge
  ];

  config.nix.settings.trusted-users = lib.pipe cfg [
    lib.attrsToList
    (builtins.filter ({ value, ... }: value.is-admin))
    (map (x: x.name))
  ];

  config.services.openssh.settings.AllowUsers = lib.pipe cfg [
    lib.attrsToList
    (builtins.filter ({ value, ... }: value.ssh-login.enable))
    (map (x: x.name))
  ];
}
