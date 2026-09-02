{
  osConfig,
  ...
}:
{
  config = {
    programs.nix-index-database.comma.enable = !osConfig.funkcia.os.new-cn-install;
    programs.nix-index.enable = !osConfig.funkcia.os.new-cn-install;
  };
}
