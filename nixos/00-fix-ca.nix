# [26.05, unstable] cacert: eMudhra 证书颁发机构 (CA) 中间证书私钥泄漏

# 接 Mozilla 通告 (https://blog.mozilla.org/security/2026/10/20/protecting-firefox-users-following-the-compromise-of-emudhra-intermediate-certificates/)，由于 eMudhra 证书颁发机构私钥泄漏，Nixpkgs 已于 #576390 (https://github.com/NixOS/nixpkgs/pull/576390)（26.05 #576401 (https://github.com/NixOS/nixpkgs/pull/576401)）撤销对以下根证书颁发机构的信任：
# - Comodo AAA Services root
# - emSign ECC Root CA - G3
# - emSign Root CA - C1
# - emSign ECC Root CA - C3

# 鉴于 PR 合并后仍需时间才能到达发布频道，建议暂时在 NixOS 配置中做如下修改：
# security.pki.caCertificateBlacklist = [
#   "Comodo AAA Services root"
#   "emSign ECC Root CA - G3"
#   "emSign Root CA - C1"
#   "emSign ECC Root CA - C3"
# ];
# 除此之外有部分软件和编程语言生态系统自带证书信任列表，这些组件也将在后续更新不再信任此证书，请各用户注意及时更新。

# (2026-10-20) nixos-{unstable,26.05}{,-small} 均已包含对应修复，请尽快更新。
{ ... }: {
  security.pki.caCertificateBlacklist = [
    "Comodo AAA Services root"
    "emSign ECC Root CA - G3"
    "emSign Root CA - C1"
    "emSign ECC Root CA - C3"
  ];
}
