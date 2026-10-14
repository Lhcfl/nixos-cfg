{
  lib,
  pkgs,
  this,
  ...
}:
{
  this.options.enable = lib.mkEnableOption "python SDK";

  config = lib.mkIf this.config.enable {
    home.packages =
      let
        wrapuv =
          name:
          pkgs.writeShellApplication {
            inherit name;
            text = /* bash */ ''
              if ! uv python find --managed-python >/dev/null 2>&1; then
                  echo "错误：未找到 uv managed Python" >&2
                  echo "请先执行 uv python install 安装至少一个 python 环境。" >&2
                  exit 1
              fi

              # 1. 检查是否已经被自己调用过（说明发生了递归）
              if [[ "''${__MARK_IS_UV_PYTHON_WRAPPER__:-}" == "1" ]]; then
                  echo "panic: 检测到递归调用！(__MARK_IS_UV_PYTHON_WRAPPER__ 已被设置)" >&2
                  echo "这通常是因为没有已安装的 uv python 导致的。请先执行 uv python install 安装至少一个 python 环境。" >&2
                  exit 1
              fi

              # 2. 打上标记，并传给后续 exec 出去的进程
              export __MARK_IS_UV_PYTHON_WRAPPER__=1

              exec uv run ${name} "$@"
            '';
          };
      in
      with pkgs;
      [
        uv # python3
        ty # python typechecker
        ruff # python linter
        (wrapuv "python")
        (wrapuv "python3")
        (wrapuv "pip")
      ];
  };
}
