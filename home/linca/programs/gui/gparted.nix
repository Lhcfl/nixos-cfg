{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.funkcia.hm.gui.enable {
    home.packages = [
      # gparted has bugs in wayland, so we need to run it with pkexec
      (pkgs.writeShellApplication {
        name = "gparted";
        runtimeInputs = with pkgs; [ gparted ];
        text = ''
          exec pkexec env \
            DISPLAY="$DISPLAY" \
            WAYLAND_DISPLAY="$WAYLAND_DISPLAY" \
            XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR" \
            "$(which gparted)"
        '';
      })
    ];

  };
}
