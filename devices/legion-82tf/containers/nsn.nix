{ pkgs, ... }: {
  funkcia.os.nsn = {
    enable = true;

    externalInterface = "wlp0s20f3";
  };

  funkcia.os.nsn.containers.nsn = {
    config = { ... }: {
      programs.fish.enable = true;

      services.openssh = {
        enable = true;
        settings.AllowUsers = [ "root" ];
      };

      funkcia.os.winslow-cloud.enable = true;

      users.users.root = {
        shell = pkgs.fish;

        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJwHaPGjtqvGsYrO5NiGHoVMSS/Qj+63hv1QNBG+wnm+ linca@nixos"
        ];
      };

      system.stateVersion = "26.11";
    };
  };
}
