{ ... }: {
  networking.hosts = {
    "114.212.85.146" = [
      "workstation.internal"
      "pi.workstation.internal"
      "dsh.workstation.internal"
    ];
  };
}
