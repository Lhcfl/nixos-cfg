{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  proxy = osConfig.networking.proxy.default or null;
  myTipsDir = "/home/linca/linca/my-tips";
in
{
  # 每小时在 /home/linca/linca/my-tips 执行一次 `bun run src/index.ts`。
  #
  # systemd 服务的环境比交互式 shell 干净得多，所以这里显式设置环境变量：
  #   - PATH：指向 home-manager 的用户 profile，保证脚本里调用到的命令能找到；
  #   - 代理：从 NixOS 的 networking.proxy 继承，保证联网时能走代理。
  # ExecStart 直接用 Nix store 里的 bun，不依赖 PATH。
  systemd.user.services.my-tips = {
    Unit = {
      Description = "生成 my-tips 的 tip.md";
    };
    Service = {
      Type = "oneshot";
      WorkingDirectory = myTipsDir;
      ExecStart = "${lib.getExe pkgs.bun} run src/index.ts";
      Environment = [
        "PATH=${config.home.profileDirectory}/bin:/run/current-system/sw/bin"
      ]
      ++ lib.optionals (proxy != null) [
        "HTTP_PROXY=${proxy}"
        "HTTPS_PROXY=${proxy}"
        "http_proxy=${proxy}"
        "https_proxy=${proxy}"
        "NO_PROXY=127.0.0.1,localhost,internal.domain"
        "no_proxy=127.0.0.1,localhost,internal.domain"
      ];
    };
  };

  # Persistent = true：到点时若机器处于关机/休眠等状态，
  # 错过的触发会在下次开机（或唤醒）后立即补跑一次。
  systemd.user.timers.my-tips = {
    Unit = {
      Description = "每小时生成一次 my-tips 的 tip.md";
    };
    Timer = {
      OnCalendar = "hourly";
      Persistent = true;
      Unit = "my-tips.service";
    };
    Install.WantedBy = [ "timers.target" ];
  };
}
