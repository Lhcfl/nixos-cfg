# pkexec 兼容层，底层调用 run0。
#
# 这**不是** polkit 真正的 pkexec：它只负责把 pkexec 的命令行接口翻译成 run0
# 调用，鉴权与提权完全交给 run0/polkit。

readonly polkit_version="@POLKIT_VERSION@"

usage() {
  cat <<'EOF'
pkexec (run0-pkexec-wrapper)

This program emulates the pkexec(1) command-line interface using
run0(1). It is NOT the real pkexec from polkit: the command runs as a
transient systemd service started by run0, and authentication is
handled by polkit.

Usage:
  pkexec --version
  pkexec --help
  pkexec [--disable-internal-agent]
  pkexec [--keep-cwd] [--user USERNAME] [PROGRAM [ARGUMENTS...]]

Options:
  --version
      Print the emulated pkexec version and exit.

  --help
      Print this help and exit.

  --disable-internal-agent
      Accepted and ignored. run0 has no internal authentication
      agent; it always uses the polkit agent registered for the
      session.

  --keep-cwd
      Run PROGRAM in the current working directory. Without this
      option PROGRAM runs in the target user's home directory, just
      like pkexec.

  --user USERNAME
      Run PROGRAM as USERNAME instead of root.

If PROGRAM is omitted, the target user's login shell is started.

See pkexec(1) for the original pkexec semantics and run0(1) for how
the command is actually executed.
EOF
}

run0_args=()
target_user=""
keep_cwd=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    --version)
      printf 'pkexec version %s (run0-pkexec-wrapper)\n' "$polkit_version"
      exit 0
      ;;
    --help)
      usage
      exit 0
      ;;
    --disable-internal-agent)
      # run0 没有也不需要内部 agent，静默忽略即可。
      shift
      ;;
    --keep-cwd)
      keep_cwd=1
      shift
      ;;
    --user=*)
      target_user="${1#--user=}"
      if [ -z "$target_user" ]; then
        printf 'pkexec: option --user requires an argument\n' >&2
        exit 127
      fi
      shift
      ;;
    --user)
      if [ "$#" -lt 2 ]; then
        printf 'pkexec: option --user requires an argument\n' >&2
        exit 127
      fi
      target_user="$2"
      shift 2
      ;;
    --)
      # 显式结束选项，下一个参数就是 PROGRAM。
      shift
      break
      ;;
    -*)
      # pkexec 会把无法识别的选项当作 PROGRAM，这里保持一致。
      break
      ;;
    *)
      break
      ;;
  esac
done

if [ -n "$target_user" ]; then
  run0_args+=("--user=$target_user")
fi

if [ "$keep_cwd" -eq 1 ]; then
  run0_args+=("--chdir=$PWD")
else
  # 默认行为与 pkexec 一致：在目标用户的家目录中运行。run0/WorkingDirectory
  # 会把 "~" 展开为目标用户的家目录。
  run0_args+=("--chdir=~")
fi

echo "warning: you're using pkexec, which is replaced by run0-pkexec-wrapper"

if [ "$#" -gt 0 ]; then
  exec run0 "${run0_args[@]}" -- "$@"
fi

exec run0 "${run0_args[@]}"
