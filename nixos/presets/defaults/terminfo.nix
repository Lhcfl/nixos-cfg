{
  this,
  config,
  lib,
  pkgs,
  ...
}:
{
  this.options = {
    enable = lib.mkEnableOption ''
      automatelly add necessary terminfos.

      从 kitty/foot/ghostty 等终端 SSH 登录时，远端需要对应的 terminfo 条目，
      否则许多程序会警告终端功能不全
    '';
    allTerminfo = lib.mkEnableOption "ALL terminfo";
  };

  # enable only when ssh login enabled
  config = lib.mkIf (this.config.enable && config.services.openssh.enable) {
    environment.enableAllTerminfo = lib.mkIf this.config.allTerminfo true;

    # ususally we only need these
    environment.systemPackages = map (x: x.terminfo) (
      with pkgs.pkgsBuildBuild;
      [
        alacritty
        ghostty
        kitty
        tmux
        wezterm
      ]
    );
  };
}
