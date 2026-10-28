{ pkgs, lib, ... }:
let
  wrapgit = (
    pkgs.writeShellApplication {
      name = "git";
      text = ''
        if [ -n "''${PI_CODING_AGENT:-}" ] || [ -n "''${DSH_SHELL:-}" ]; then
          exec ${lib.getExe pkgs.git} \
            -c gpg.format=ssh \
            -c user.signingkey="$HOME/.ssh/id_agent.pub" \
            -c user.name="Linca's Agent" \
            -c user.email="lhcfl+agent@outlook.com" \
            "$@"
        fi

        exec ${lib.getExe pkgs.git} "$@"
      '';
    }
  );
in
{
  programs.git = {
    enable = true;

    package = wrapgit;

    signing.allowedSigners = ''
      lhcfl+agent@outlook.com namespaces="git" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ0plwge/SKUhhxxCm8fmfpRtaNay9rDdSZZKOSJ9QRD linca@legion-82tf
    '';
  };
}
