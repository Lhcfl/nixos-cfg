{ inputs, ... }:
{
  programs.yazi = {
    enable = true;
    theme = {
      flavor.dark = "everforest-medium";
    };

    settings = {
      mgr.show_hidden = true;
    };

    flavors = {
      everforest-medium = inputs.yazi-everforest-medium;
    };
  };
}
