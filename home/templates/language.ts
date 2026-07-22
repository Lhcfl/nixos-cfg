import process from "node:process";
import fs from "node:fs/promises";
import path from "node:path";

const template = lang => `
{
  lib,
  pkgs,
  config,
  ...
}:
{
  options.funkcia.hm.language-sdk.${lang}.enable = lib.mkEnableOption "Enable ${lang} SDK";

  config = lib.mkIf config.funkcia.hm.language-sdk.${lang}.enable {
    home.packages = with pkgs; [ hello ];
  };
}
`

console.log(process.argv);

const lang = process.argv.at(-1);

if (lang.match(/^[a-zA-Z_\-]+[a-zA-Z0-9_\-]*$/)) {
    const result = template(lang);
    const to = path.resolve(import.meta.dirname, `../modules/language-sdk/${lang}.nix`);
    console.log(result);
    console.log("write below to =>", to);
    await fs.writeFile(to, result);
} else {
    console.error(lang, "is not valid name");
}
