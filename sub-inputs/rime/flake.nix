{
  description = "rime files";

  inputs = {
    rime-luna-pinyin = {
      url = "github:rime/rime-luna-pinyin";
      flake = false;
    };

    rime-essay = {
      url = "github:rime/rime-essay";
      flake = false;
    };

    rime-emoji = {
      url = "github:rime/rime-emoji";
      flake = false;
    };
  };

  outputs = inputs: inputs;
}
