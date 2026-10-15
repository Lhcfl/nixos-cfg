{
  pkgs,
  config,
  lib,
  ...
}:
{
  config = lib.mkIf config.linca.work.enable {
    # DeepSeek Harness。
    #
    # nixpkgs 编译的 node 带硬化，导致 `node-addon-require-builtin` 反汇编
    # V8 getter 失败。llm-agents 上游现在**已经内置**了这个 workaround
    # （patch dsh-app-boot 的 index.js 与 worker/profile-resolution-bootstrap.js，
    # 把 requireBuiltin 改成 createRequire(import.meta.url)），所以这里不需要
    # 再自己 override —— 之前那份 override 会和上游重复应用同一处替换而失败。
    #
    # 见 https://github.com/numtide/llm-agents.nix/issues/9994
    home.packages = [ pkgs.llm-agents.dsh ];
  };
}
