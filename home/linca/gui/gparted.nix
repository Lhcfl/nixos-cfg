{
  pkgs,
  ...
}:
{
  home.packages = [
    # gparted has bugs in wayland, so we need to run it with pkexec
    (pkgs.writeShellApplication {
      name = "gparted";
      runtimeInputs = with pkgs; [ gparted ];
      text = ''
        exec run0 \
          --setenv=DISPLAY="$DISPLAY" \
          --setenv=WAYLAND_DISPLAY="$WAYLAND_DISPLAY" \
          --setenv=XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
          "$(which gparted)"
      '';
    })
  ];
}
