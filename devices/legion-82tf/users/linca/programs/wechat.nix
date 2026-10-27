# 会赢吗？
# 微信经常会偷偷改文件导致 hash mismatch，如果炸了就关掉微信
{ pkgs, lib, ... }:
let
  enable = true;
in
{
  config = lib.mkIf enable {
    home.packages = with pkgs; [
      wechat
    ];
  };
}
