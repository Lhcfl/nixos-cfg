{ pkgs, ... }: {

  programs = {
    # desktop
    hyprland.enable = true;
    waybar.enable = true;

    # use default ssh agent
    ssh.startAgent = true; 
  };

}