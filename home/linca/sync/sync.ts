import fs from "fs/promises";
import { homedir } from "node:os";
import path from "node:path";

const here = import.meta.dirname;

const dir = path.join(here, "Config/");

const DIR_MAP = {
  "Config/hypr": ".config/hypr",
  "Config/nvim": ".config/nvim",
  "Config/vicinae": ".config/vicinae",

  "State/noctalia/settings.toml": ".local/state/noctalia/settings.toml",
}

const red = (s: string) => `\x1b[31m${s}\x1b[0m`;
const green = (s: string) => `\x1b[32m${s}\x1b[0m`;
const yellow = (s: string) => `\x1b[33m${s}\x1b[0m`;
const blue = (s: string) => `\x1b[34m${s}\x1b[0m`;

for (const [s, d] of Object.entries(DIR_MAP)) {
  const source = path.join(here, s);
  const dest = path.join(homedir(), d);

  const withGroup = (fn: () => void) => {
    console.group()
    fn()
    console.groupEnd()
  }

  let statue

  try {
    const x = await fs.lstat(dest);
    if (x.isSymbolicLink()) {
      const origin = await fs.readlink(dest);
      if (
        path.normalize(source) == path.normalize(origin)
      ) {
        console.log(green("[SKIP]"), blue("already linked"), s, "->", dest);
        continue;
      }

      withGroup(() => {
        console.error(red("[ERR]"), "exists a symlink", dest, "->", origin)
      });
    }

    withGroup(() => {
      console.error(red("[ERR]"), "exists a file: ", dest)
    })
  } catch {
    await fs.symlink(source, dest).catch((err) => console.error(err)).then(() => {
      console.log(green("[OK]"), source, "->", dest);
    })
  }
}

// fs.link()
