{
  pkgs,
  config,
  lib,
  ...
}:
let
  # DeepSeek Harness。
  #
  # nixpkgs 编译的 node 带 zerocallusedregs 硬化（函数结尾会 `xor %edi,%edi`），
  # 导致 `node-addon-require-builtin` 按字节模式反汇编 V8 getter 时匹配失败，
  # 直接 fatal：`Unsupported/no-getter`。llm-agents 的包装已经给 node 加了
  # `--expose-internals`，但 0.2.0-rc.2 的 `dsh-app-boot` 是无条件走 addon 的
  # （但 `cordis-plugin-loader` 有 execArgv 兜底）：这里把同一兜底补上，让
  # `requireBuiltin` 直接走 `createRequire`，即 node 暴露出来的 internal 模块。
  #
  # 见 https://github.com/numtide/llm-agents.nix/issues/9994
  dsh = pkgs.llm-agents.dsh.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      substituteInPlace \
        $out/lib/node_modules/@deepseek-ai/dsh/node_modules/@deepseek-ai/dsh-app-boot/lib/index.js \
        --replace-fail \
        'createRequire(import.meta.url)("node-addon-require-builtin")' \
        '{ requireBuiltin: createRequire(import.meta.url) }'
    '';
  });
in
{
  config = lib.mkIf config.linca.work.enable {
    home.packages = [ dsh ];
  };
}
