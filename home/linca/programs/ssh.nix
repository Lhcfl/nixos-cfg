_: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        addKeysToAgent = "yes";
        serverAliveInterval = 30;
        userKnownHostsFile = "~/.ssh/known_hosts";
      };
      "github.com" = {
        user = "Lhcfl";
        hostname = "github.com";
        identityFile = "~/.ssh/id_ed25519.github";
        addKeysToAgent = "yes";
      };
    };
  };
}
