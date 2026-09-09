{ ... }: {
  imports = [
    ./fish/greeter.nix
    ./systemd/my-tips.nix
  ];

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
