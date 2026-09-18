{ inputs, ... }:
let
  name = "commit";
in
{
  perSystem =
    {
      pkgs,
      config,
      system,
      ...
    }:
    {
      packages.${name} = pkgs.writeShellApplication {
        name = "commit";
        runtimeInputs = [
          inputs.shell-auto-pi.packages.${system}.default
        ];
        text = ''
          shell-auto-pi commit "$@"
        '';
      };
      overlayAttrs.${name} = config.packages.${name};
    };
}
