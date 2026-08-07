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

for (const [source, dest] of Object.entries(DIR_MAP).map(([source, dest]) => [
  path.join(here, source),
  path.join(homedir(), dest)
] as const)) {
  console.log("linking", source, "from", source, "->", dest);

  try {
    const x = await fs.lstat(dest);
    if (x.isSymbolicLink()) {
      const origin = await fs.readlink(dest);
      if (
        path.normalize(source) == path.normalize(origin)
      ) {
        console.log("success.")
        continue;
      }

      console.error("exists a symlink: ", dest, "->", origin)
    }

    console.error("exists a file: ", dest)
  } catch {
    await fs.symlink(source, dest).catch((err) => console.error(err))
  }
}

// fs.link()
