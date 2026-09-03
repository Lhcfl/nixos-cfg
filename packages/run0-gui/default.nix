{ ... }:
let
  name = "run0-gui";
in
{
  perSystem = { pkgs, config, ... }: {
    packages.${name} = pkgs.writeShellApplication {
      name = name;
      text = ''
        exec run0 \
          --setenv=DISPLAY="$DISPLAY" \
          --setenv=WAYLAND_DISPLAY="$WAYLAND_DISPLAY" \
          --setenv=XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
          "$@"
      '';
    };
    overlayAttrs.${name} = config.packages.${name};
  };
}
