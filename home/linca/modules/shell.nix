{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  shell-auto-pi = inputs.shell-auto-pi.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  programs.fish = {
    shellAliases = {
      nd = "nix develop -c $SHELL";
    };

    functions.fish_command_not_found = lib.mkIf config.funkcia.hm.programs.pi.enable ''
      if status is-interactive
        ${lib.getExe shell-auto-pi} auto $argv
      else
        __fish_default_command_not_found_handler $argv
      end
    '';
  };
}
