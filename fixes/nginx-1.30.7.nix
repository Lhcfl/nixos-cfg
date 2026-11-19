# fixes/nginx-1.30.7.nix
#
# =============================================================================
#  把 nginx 提前顶到上游 1.30.7（2026-11-18 安全版本）
# =============================================================================
#
# ── 背景 ────────────────────────────────────────────────────────────────────
# 上游 nginx 在 2026-11-18 发布了一批安全修复（CHANGES-1.30），同时修复
# 1.30.7 / 1.31.9 两支。nixpkgs 目前还是 1.30.6，在它追上来之前用本 fix 顶上。
#
# 被修掉的洞里比较要紧的几个（完整列表见
# https://nginx.org/en/security_advisories.html）：
#   * CVE-2026-123007 (major)  HTTP/2 流控窗口整数溢出 → 内存破坏
#   * CVE-2026-118899 (major)  读 client request body over TLS 1.3 死循环
#   * CVE-2026-113425 (major)  mail proxy 模块 use-after-free
#   * CVE-2026-125283           alias + try_files 缓冲区溢出
#   * CVE-2026-123633/123634   HTTP/2 / resolver use-after-free
#   * CVE-2026-121810          HTTP/3 use-after-free
#   * CVE-2026-120967          stream 模块 client 证书校验的 SNI 绕过
#
# 注意 1.31.4-1.31.8 还有一个 CVE-2026-120993（PROXY protocol v2 空指针），
# 但 1.30.x 分支不受影响，本机也没用 mainline，所以这里只处理 stable 支。
#
#
# ── 为什么不能直接 `.override` ──────────────────────────────────────────────
# nixpkgs 里 `nginxStable` 是
#   callPackage ../servers/http/nginx/stable.nix { ... }
# 而 stable.nix 是
#   args: callPackage ./generic.nix args { version = "1.30.6"; hash = "..."; ... }
# 显式参数排在 `args` 之后，会覆盖 `.override` 传进去的同名参数，所以
# `nginx.override { version = "1.30.7"; }` 无效。版本和 src 只能走
# `overrideAttrs`。
#
#
# ── 已验证 ──────────────────────────────────────────────────────────────────
# 1.30.7 与 1.30.6 同属一个补丁分支，nixpkgs 带的两个补丁都还能用（已用
# `patch --dry-run` 逐个试过）：
#   * nix-etag-1.15.4.patch          → 偏移 +21 行，成功
#   * nix-skip-check-logs-path.patch → 成功
# 并且 generic.nix 的 postPatch 会 `--replace-fail '@nixStoreDir@'`，
# 这个占位符由 nix-etag 补丁引入，打完后确实存在，不会炸。
#
# 上游 CHANGES-1.30 里 1.30.7 只有安全修复，没有需要同步调整的构建改动。
# `nginx-doc` 是独立 derivation（文档仓库按日期固定），与 nginx 版本无关，
# 无需跟着动。
#
#
# ── 维护 ────────────────────────────────────────────────────────────────────
# nixpkgs 升到 ≥ 1.30.7 之后直接删掉本文件。
# 升级时只需改 version 与 hash，hash 用
#   nix store prefetch-file --json https://nginx.org/download/nginx-<ver>.tar.gz
# 取，并重新跑一遍补丁 dry-run，确认两个补丁没被上游改到打不上。
#
# =============================================================================

{ ... }:
{
  nixpkgs.overlays = [
    (
      final: prev:
      let
        nginx_1_30_7 = prev.nginxStable.overrideAttrs (old: {
          version = "1.30.7";
          src = final.fetchurl {
            url = "https://nginx.org/download/nginx-1.30.7.tar.gz";
            hash = "sha256-JWW1yDcFDpWPcPsPc8SOK8pFQq00n9NW9G+wxyYQvG4=";
          };
          passthru = (old.passthru or { }) // {
            # 让还按旧属性名读取下游（模块 supports 检查）也能拿到正确版本。
            nginxVersion = "1.30.7";
          };
        });
      in
      {
        # `nginx` 在 nixpkgs 里是 `nginx = nginxStable` 的别名，别名已固化，
        # 只覆盖 nginxStable 不会改动 pkgs.nginx，所以两个都要覆盖。
        nginxStable = nginx_1_30_7;
        nginx = nginx_1_30_7;
      }
    )
  ];
}
