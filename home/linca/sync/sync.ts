import fs from "fs/promises";
import { homedir } from "node:os";
import path from "node:path";

const here = import.meta.dirname;

const dir = path.join(here, "Config/");
for (const config of await fs.readdir(dir)) {
  const src = path.join(dir, config);
  const dist = path.join(homedir(), ".config", config)
  console.log("linking", config, "from", src, "->", dist);

  try {
    const x = await fs.lstat(dist);
    if (x.isSymbolicLink()) {
      const origin = await fs.readlink(dist);
      if (
        path.normalize(src) == path.normalize(origin)
      ) {
        console.log("success.")
        continue;
      }

      console.error("exists a symlink: ", dist, "->", origin)
    }

    console.error("exists a file: ", dist)
  } catch {
    await fs.symlink(src, dist).catch((err) => console.error(err))
  }
}

// fs.link()
