{ pkgs, ... }: {

  programs = {
    fish.enable = true;
    nushell.enable = true;
    git.enable = true;
    nh.enable = true;
    neovim.enable = true;
    mtr.enable = true;
    nix-ld.enable = true;
  };

  # 需要的话在这里加 live 环境里的包 / 用户
  environment.systemPackages = with pkgs; [
    # 压缩文件
    zip
    unzip
    unar

    # 各种工具
    wget
    bun
    htop
    openssl
    jq
    funkcia.run0-gui

    # gui helper
    alacritty
    qdiskinfo
    gparted

    # 添加 coding agent 方便调试
    pi-coding-agent
  ];
}
