{
  osConfig,
  ...
}:
{
  config =
    let
      enabled = !(osConfig.funkcia.os.new-cn-install or false);
    in
    {
      programs.nix-index-database.comma.enable = enabled;
      programs.nix-index.enable = enabled;
    };
}
