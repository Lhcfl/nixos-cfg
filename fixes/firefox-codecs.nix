# fixes/firefox-codecs.nix
#
# =============================================================================
#  Firefox 系浏览器视频解码修复（全局 overlay 模块）
# =============================================================================
#
# ── 目录说明 ────────────────────────────────────────────────────────────────
# 本文件位于项目根目录的 `fixes/` 下。
# `fixes/` 目录在 flake.nix 的 `nixos.sharedModules` 中被
# `funkcia-utils.files.mkRecDirModule` 递归自动导入，因此往这个目录里新增任意
#  `.nix` 模块都会被所有设备自动加载。请保持每个文件都是**独立的 NixOS 模块**。
#
#
# ── 背景（为什么会有这个 fix）─────────────────────────────────────────────
# 在 Zen 浏览器（基于 Firefox）的 `about:media` 页面中，用户发现：
#   * 软件解码（Software Decoding）：H.264 / HEVC / AAC 显示 "Unsupported"，
#     而 VP8 / VP9 / AV1 / Opus / FLAC 等显示 "Supported"。
#   * 硬件解码（Hardware Decoding）：全部显示 "Unsupported"。
# 而在 Windows 下同一台机器上这些编解码器都正常（H.264/VP9/VP8/AV1/HEVC 均支持
# 硬件解码，H.264/HEVC/AAC 均支持软件解码）。
#
# 这个现象是 NixOS 上 Firefox 系浏览器很典型的问题，本质原因如下。
#
#
# ── 根因分析 ──────────────────────────────────────────────────────────────
# 1. 专利/许可编解码器的软件解码依赖「系统 FFmpeg」
#    Firefox 自身会打包一个内置的 libavcodec（libmozavcodec.so / libgkcodecs.so，
#    由 Mozilla 从 FFmpeg 源码裁剪编译而来）。为了让开源合规，Mozilla 会在编译
#    时**剔除掉**受专利/许可限制的解码器，恰好就是：
#        H.264（AVC）、HEVC、AAC
#    而 VP8/VP9/AV1/Opus/FLAC 等开源编解码器被保留，所以它们显示 "Supported"。
#    要解码 H.264/HEVC/AAC，Firefox 需要回退到**系统提供的 FFmpeg**（通过
#    dlopen `libavcodec.so.<N>` 加载其中的这些解码器）。
#
# 2. nixpkgs 的 `wrapFirefox` 只在特定条件下接入系统 FFmpeg
#    看 nixpkgs 源码 `pkgs/applications/networking/browsers/firefox/wrapper.nix`：
#       withFFmpeg = browser.withFFmpeg or false;
#       ...
#       libs = ... ++ lib.optional withFFmpeg ffmpegPackage;
#    也就是说，只有当浏览器派生项（derivation）的 `passthru` 里存在
#    `withFFmpeg = true` 时，`wrapFirefox` 才会把系统 FFmpeg 加到
#    `LD_LIBRARY_PATH`，从而让 Firefox 能按 soname 找到系统 `libavcodec.so`。
#    对照：
#       * nixpkgs 自带 `firefox-bin`（Mozilla 官方二进制）正确设置了
#         `passthru.withFFmpeg = true`（见 firefox-bin/default.nix）。
#       * 但 zen-browser-flake 写的却是 `passthru.ffmpegSupport = true`
#         （属性名写错了），`wrapFirefox` 读取的 `browser.withFFmpeg` 是 false，
#         于是系统 FFmpeg 从未被接入 → H.264/HEVC/AAC 一直是 "Unsupported"。
#
# 3. `wrapFirefox` 还会按「浏览器 version 字符串」选择 FFmpeg 主版本
#    wrapper.nix 里的逻辑：
#       ffmpegPackage =
#         if lib.versionAtLeast browser.version "153.1" then ffmpeg_9 else ffmpeg_8;
#    Firefox 需要与它 dlopen 的 soname 匹配的 libavcodec 主版本：
#       * FFmpeg 8  → libavcodec.so.62（Firefox < 153.1）
#       * FFmpeg 9  → libavcodec.so.63（Firefox ≥ 153.1 / 154+）
#    `browser.version` 取自派生项的 `version` 属性。二进制发布版把「应用版本」
#    （如 Zen 的 "1.22b"）存在这里，而不是真正的 Firefox 版本，导致比较失败，
#    于是选了错误的 FFmpeg（对 Zen 来说会错选 ffmpeg_8 / libavcodec 62），
#    soname 对不上，解码器依然加载不到。
#
# 4. 硬件解码（VA-API）需要系统级 VA-API 驱动 + 浏览器偏好
#    本机 Legion 的内屏实际由 **Intel iGPU（Alder Lake P）** 驱动
#    （card2-eDP-1 已连接，NVIDIA eDP-2 未连接）。之前系统只装了
#    `nvidia-vaapi-driver`，**没有 Intel 的 VA-API 驱动**，所以即便浏览器开启
#    硬件解码也找不到可用驱动。
#    注：这台机器 `hardware.nvidia.videoAcceleration`（默认 true）已把
#    `nvidia-vaapi-driver` 装进了 `hardware.graphics.extraPackages`，真正缺的是
#    Intel 一侧，故在 `devices/legion-82tf/configuration.nix` 里补了
#    `hardware.graphics.extraPackages = [ pkgs.intel-media-driver ];`。
#    同时需要在浏览器偏好里打开 VA-API（见下方 `extraPrefs`）。
#
#
# ── 本 fix 做了什么 ────────────────────────────────────────────────────────
# * 对「所有 Firefox 系二进制浏览器」做**幂等**修复：强制
#   `passthru.withFFmpeg = true`（包裹 `firefox-bin` / `floorp-bin` / `librewolf-bin`）。
#   这些包 nixpkgs 本来就已经设置正确，所以改写不产生新输出（passthru 不参与
#   派生哈希），纯粹是兜底，防止其它上游 flake 也犯同样的属性名错误。
# * 对 zen-browser（从 zen-browser-flake 来）做**专门修复**：
#   - 通过 `overrideAttrs` 把 `version` 改成真正的 Firefox 基础版本 `155.0.1`，
#     让 `wrapFirefox` 选对 FFmpeg 9（libavcodec 63）；
#     （用 `__intentionallyOverridingVersion = true` 关闭 nixpkgs 报的
#       "override version without src" 警告，因为这是有意为之。）
#   - 同时把 `passthru.withFFmpeg = true` 接上，让系统 FFmpeg 真正被加载。
#   - 用 `extraPrefs` 写入 VA-API / 硬件解码偏好（默认值，用户可通过 user.js 覆盖）。
# * 最终以 `pkgs.zen-browser` 暴露给下游（home-manager 里 `home.packages`
#   直接引用），用户只需 `pkgs.zen-browser` 即得到修复后的浏览器。
#
#
# ── 版本映射（升级时需留意）──────────────────────────────────────────────
# `zen-browser` 的 Firefox 基础版本一旦变化，需要同步调整下面的 `version`：
#   * 本文件写死 `version = "155.0.1"`（Zen 1.22b 的 Firefox 基础版本）。
#   * 若 Zen 升级后基础 Firefox 仍是 ≥153.1，则 keep `155.0.1` 或改成新的
#     基础版本都行（只要 ≥153.1 且 soname 仍为 63）。
#   * 若某天 Firefox 升到某个需要 libavcodec 64（假设未来 FFmpeg 10）的版本，
#     nixpkgs wrapper.nix 的阈值和本文件的 version 都要跟着更新。
# 判断方法：解压 zen 包读 `lib/zen-<version>/application.ini` 或 `platform.ini`
# 中的 `Milestone` / `MinVersion`，即可知道真正的 Firefox 基础版本。
#
#
# ── 参考资料 ──────────────────────────────────────────────────────────────
# * nixpkgs wrapper.nix：
#   pkgs/applications/networking/browsers/firefox/wrapper.nix
#   - `withFFmpeg = browser.withFFmpeg or false;`
#   - `ffmpegPackage = if lib.versionAtLeast browser.version "153.1" then ffmpeg_9 else ffmpeg_8;`
#   - 注释提到：libavcodec 62 → FFmpeg 8（Firefox < 153.1）；
#               libavcodec 63 → FFmpeg 9（Firefox ≥ 153.1）。
# * nixpkgs ffmpeg：`pkgs.development.libraries.ffmpeg/default.nix`
#   - `ffmpeg_8`（v8.1.x，libavcodec 62）、`ffmpeg_9`（v9.0.x，libavcodec 63）。
# * nixpkgs firefox-bin 的正确写法（对比用）：
#   pkgs/applications/networking/browsers/firefox-bin/default.nix
#   - `passthru.withFFmpeg = true;`
#   - `passthru.withGSSAPI = true;`
#
#
# ── 维护建议 ──────────────────────────────────────────────────────────────
# * 若新增另一个 Firefox 系二进制浏览器 flake（如 floorp/librewolf 的自建 flake）
#   也出现 "H.264/HEVC/AAC 不支持"，多半是同一个原因：上游把 `withFFmpeg`
#   写成了别的名字，或 version 不是 Firefox 基础版本。参照 zen-browser 的写法
#   新增一条即可。
# * 本模块是 NixOS 模块，直接往 `nixpkgs.overlays` 追加 overlay。新设备无需额外
#   配置，随 `fixes/` 自动导入自动生效。
#
# =============================================================================

{ inputs, ... }:
let
  inherit (inputs.nixpkgs) lib;
in
{
  nixpkgs.overlays = [
    (final: prev:
      let
        inherit (final.stdenv.hostPlatform) system;

        # Wire the system FFmpeg into a Firefox-family binary browser so the
        # proprietary H.264 / HEVC / AAC software decoders are available.
        enableCodecs = browser:
          browser.overrideAttrs (old: {
            passthru = (old.passthru or { }) // { withFFmpeg = true; };
          });

        # zen-browser (zen-browser-flake) is based on Firefox 155, which dlopens
        # `libavcodec.so.63` (FFmpeg 9). The flake stores the *application*
        # version in the derivation `version`, so we inject the real Firefox
        # version to make `wrapFirefox` choose the correct FFmpeg major, fix the
        # `withFFmpeg` wiring, and enable VA-API hardware decoding via prefs.
        zen-browser =
          let
            unwrapped = (inputs.zen-browser.packages.${system}.zen-browser-unwrapped).overrideAttrs (old: {
              __intentionallyOverridingVersion = true;
              version = "155.0.1";
              passthru = (old.passthru or { }) // { withFFmpeg = true; };
            });
            extraPrefs = ''
              pref("media.ffmpeg.vaapi.enabled", true);
              pref("media.hardware-video-decoding.enabled", true);
              pref("media.hardware-video-decoding.force-enabled", true);
              pref("media.hardware-video-decoding.failures", 0);
              pref("gfx.webrender.all", true);
            '';
          in
          final.wrapFirefox unwrapped {
            pname = "zen-browser";
            inherit extraPrefs;
          };
      in
      {
        # Idempotent safety net for nixpkgs Firefox-family binary builds.
        firefox-bin = enableCodecs prev.firefox-bin;
        floorp-bin = enableCodecs prev.floorp-bin;
        librewolf-bin = enableCodecs prev.librewolf-bin;

        # Fixed zen-browser package (from the zen-browser-flake), consumable as
        # `pkgs.zen-browser`.
        inherit zen-browser;
      })
  ];
}
