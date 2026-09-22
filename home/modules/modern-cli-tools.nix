{
  pkgs,
  config,
  lib,
  ...
}:
{
  options.funkcia.hm.modern-cli-tools.enable = lib.mkEnableOption ''
    现代化的 CLI 工具，包括 fzf, ripgrep 等

    - zoxide 替换 cd
    - bat 替换 cat
    - eza 替换 ls
    - fzf 作为 fuzzy finder
    - fd 替换 find
    - rg 替换 grep
    - fish 作为 interactive shell
  '';

  config = lib.mkIf config.funkcia.hm.modern-cli-tools.enable {
    # 自动使得所有 shellIntergration 生效
    home.shell.enableShellIntegration = true;

    programs.zoxide.enable = true; # replace cd

    programs.fish.enable = true; # user friendly shell

    programs.starship.enable = true; # shell prompts

    programs.eza = {
      # replace ls
      enable = true;
      icons = "auto";
      colors = "auto";
    };

    programs.bat.enable = true;

    programs.fzf.enable = true;

    programs.fd.enable = true;

    programs.ripgrep.enable = true;

    programs.btop = {
      enable = true;
      settings = {
        # 按瞬时 CPU% 严格重排，方便抓发热元凶（默认 "cpu lazy" 列表更稳）
        proc_sorting = "cpu direct";
        # 树状显示，看清 Nix wrapper 底下的真实进程
        proc_tree = true;
        # 关掉透明化
        proc_gradient = false;
        # 聚合 process 资源
        proc_aggregate = true;
        # 隐藏 kworker 之类的内核线程
        proc_filter_kernel = true;
        # 四个框都显示（尤其 mem）
        shown_boxes = "cpu mem net proc";
        # 配置由 home-manager 管理，不要让 btop 退出时回写只读文件
        save_config_on_exit = false;
      };
    };

    # programs.atuin.enable = true;
  };
}
