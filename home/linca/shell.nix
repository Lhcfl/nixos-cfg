_: {
  programs = {
    zoxide.enable = true;
    fish = {
      enable = true;

      loginShellInit = ''
        if uwsm check may-start;
          uwsm start default
        end
      '';
    };
    starship.enable = true;
    nushell.enable = true;
  };
}
