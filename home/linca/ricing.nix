{ utils, ... }: {
  imports = utils.files.listNixFilesRec ./ricing;

  funkcia.hm.ricing = {
    transparency.enable = true;
  };
}
