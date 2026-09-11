{ ... }: {
  # 本机不启用用户级 sops（无 ~/.config/sops/age/keys.txt），避免 hm-activate 失败
  linca.sops.enable = false;
}
