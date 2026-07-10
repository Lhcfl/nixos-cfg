# AGENTS.md

Personal NixOS system config (flake-based), named **funkcia**. Single host `nixos` on x86_64-linux (Legion laptop).

## Deploy

```bash
./apply.sh          # runs: sudo nixos apply && bun home/linca/sync/sync.ts
```

Validate without applying:

```bash
nix build .#checks.x86_64-linux.nixosTopLevel
```

## Structure

```
flake.nix              # root; single nixosConfigurations.nixos
global/                # system-wide NixOS config (auto-imported)
modules/               # optional NixOS features, gated by funkcia.modules.* options
devices/legion-82tf/   # hardware + device-specific overrides
home/home-manager.nix  # home-manager bridge
home/linca/
  home.nix             # user entrypoint
  gui/                 # HM GUI modules, gated by funkcia.hm.* options
  gui/modules/         # auto-imported by gui.nix
  programs/            # per-program HM configs (auto-imported)
  dotfiles/            # Nix store copies → ~/.config/
  sync/Config/         # runtime symlinks → ~/.config/ (editable, applied by sync.ts)
common/                # shared package lists
utils/files.nix        # listNixFilesRec helper
```

## Key conventions

- **`funkcia` option namespace**: NixOS modules use `funkcia.modules.<name>.enable`; home-manager modules use `funkcia.hm.<name>.enable`. Always gate with `lib.mkIf`.
- **Auto-import via `listNixFilesRec`**: `global/`, `modules/`, and `home/linca/programs/` are auto-discovered. Adding a `.nix` file to these dirs auto-imports it — no manual `imports` needed.
- **Two dotfile mechanisms**:
  - `home/linca/dotfiles/` → Nix store copies (immutable at runtime). Managed by `dotfiles.nix`.
  - `home/linca/sync/Config/` → runtime symlinks created by `bun home/linca/sync/sync.ts`. Editable on disk.
- **lix, not nix**: Uses `pkgs.lixPackageSets.stable.lix` (see `global/nix.nix`).
- **nixfmt**: Use `nixfmt` (the nixpkgs-rfc-style one, already in `packages.nix`).
- **Bun**: JS/TS runtime. `package.json` at root and `home/linca/dotfiles/waybar/`.
- **home-manager backup**: Conflicts produce `.hm.old` files (see `backupFileExtension` in `home-manager.nix`).
- **NixOS check**: `nix build .#checks.x86_64-linux.nixosTopLevel` builds the full system toplevel — use for CI or pre-deploy validation.
