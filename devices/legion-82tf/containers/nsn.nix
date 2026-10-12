{ pkgs, funkcia-utils, ... }: {
  funkcia.os.nsn = {
    enable = true;

    externalInterface = "wlp0s20f3";

    containers.nsn = {
      autoStart = false;

      config = { ... }: {
        programs.fish.enable = true;

        services.openssh = {
          enable = true;
          settings.AllowUsers = [ "root" ];
        };

        funkcia.os.winslow-cloud.enable = true;

        users.users.root = {
          shell = pkgs.fish;

          openssh.authorizedKeys.keys = funkcia-utils.linca.keys;
        };

        system.stateVersion = "26.11";
      };
    };
  };
}
