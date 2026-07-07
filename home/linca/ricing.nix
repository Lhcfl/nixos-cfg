{ utils, ... }: {
  imports = utils.files.listNixFiles ./ricing;

  funkcia.hm.ricing = {
    transparency.enable = true;
  };
}
