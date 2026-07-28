{
  pkgs,
  ...
}:
{
  home = {
    pointerCursor = {
      enable = true;
      hyprcursor.enable = true;
      size = 24;
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };

    packages = with pkgs; [
      hyprcursor
    ];
  };
}
