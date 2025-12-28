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
    };
  };
}
