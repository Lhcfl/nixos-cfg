{ lib, ... }:
let
  name = "run0-pkexec-wrapper";
in
{
  perSystem =
    { pkgs, config, ... }:
    {
      packages.${name} = pkgs.writeShellApplication {
        name = "pkexec";
        runtimeInputs = [ pkgs.systemd ];

        text = lib.replaceStrings [ "@POLKIT_VERSION@" ] [ pkgs.polkit.version ] (
          builtins.readFile ./pkexec.bash
        );

        meta = {
          description = "pkexec compatibility wrapper that delegates to run0";
          mainProgram = "pkexec";
          platforms = pkgs.lib.platforms.linux;
        };
      };

      overlayAttrs.${name} = config.packages.${name};
    };
}
