{ pkgs, ... }: {
  imports = [
    ./fish/greeter.nix
    ./systemd/my-tips.nix
  ];

  home = {
    packages = [ pkgs.wpsoffice-cn ];

    # WPS 自带 Qt 只有 xcb 插件，Wayland 分数缩放下 DPI 异常。
    # WPS 会读取 WPS_FORCED_DPI 并转成 QT_FONT_DPI（128 实测合适）。
    sessionVariables.WPS_FORCED_DPI = "128";
  };

  funkcia.hm = {
    wine.enable = true;
    language-sdk = {
      cpp.enable = true;
      javascript.enable = true;
      nix.enable = true;
      python.enable = true;
    };
  };

  linca = {
    work.enable = true;
    play.enable = true;
  };

  programs.ssh.settings = {
    "github.com" = {
      user = "Lhcfl";
      hostname = "github.com";
      identityFile = "~/.ssh/id_ed25519.github";
      addKeysToAgent = "yes";
    };
    "gitcode.com" = {
      identityFile = "~/.ssh/id_ed25519.gitcode";
      addKeysToAgent = "yes";
    };
  };

  funkcia.hm.gui.umbriel.settings.output.eDP-1 = {
    scale = 1.5;
    hdr = "on";
  };
}
