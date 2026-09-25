# Taste

- Communicates in Chinese and expects answers in Chinese. Confidence: 0.6
- Prefers reusable, device-agnostic config in `modules/` gated behind `lib.mkEnableOption` options under the `funkcia.os.*` namespace, rather than duplicating device-specific service files; devices opt in via `funkcia.os.<name>.enable = true;` in their `configuration.nix`. Confidence: 0.75
- Wants duplicated/byte-identical per-device service configs consolidated into the shared module rather than left in place, even when only one device was the original target. Confidence: 0.65
- Only run `nh os build` and `nvd diff` verification for the local machine's host; for other devices' hosts, skip the build (it would download large closures and `nvd diff` doesn't apply) and rely on evaluation instead. Confidence: 0.85
- Keeps `.commandcode` config under version control and wants it committed alongside code changes. Confidence: 0.6
