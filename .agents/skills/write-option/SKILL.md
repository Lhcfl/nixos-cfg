---
name: write-option
description: Guides creating a NixOS / Home Manager `mkOption` by reusing existing nixpkgs types, formats, and generators instead of inventing new ones. Use when writing a module option, a `settings`/config option for a program or service, or any time you are about to write `lib.mkOption`.
---

# Write Option

When creating a Nix option, DO NOT invent a type or a serializer. nixpkgs already ships
the right primitives. This skill encodes the lessons from a real mistake: writing a
`settings` option as `lib.types.lines` (raw text) for a format that already had a native
Nix type and generator.

## The core lesson

Before writing an option, **check what nixpkgs already provides**:

1. `lib.types.*` — for the **option type** (validates the value).
2. `pkgs.formats.<fmt> {}` — gives you a **paired `.type` and `.generate`** so the
   option's type and the serializer stay consistent.

These are meant to be used together. Use that pairing; never hand-roll a converter or
fall back to generic types (`anything`, `str`, `coercedTo`) when a real type exists.

## Step 1: Search before you build

```bash
# Is there an existing nixpkgs option for this program?
nh search options {program-name} --scope=home-manager   # or --scope=nixpkgs

# Does a format type exist?
# In-repo: search for existing usage to follow module conventions
rg "formats\." modules/ home/ --type nix | head
```

## Step 2: Pick the right type for the data shape

- Program config already has a real type → use `pkgs.formats.<fmt> {}.type`
  (e.g. `toml`, `json`, `yaml`, `ini`, `nixconf`). Check what actually exists:
  ```bash
  nix eval --json --impure --expr 'let pkgs = import <nixpkgs> {}; in builtins.attrNames pkgs.formats'
  ```
- Plain list of lines → `lib.types.lines` (only when no format converter applies, e.g. KDL).
- Boolean switch → `lib.mkEnableOption "..."`.
- String/int/bool/etc. → the specific `lib.types.{str,int,bool}`.

Choose the most specific type. `lib.types.anything` and `lib.types.str` are last resorts.

## Step 3: Use the paired generator

Define the format once, use both `.type` and `.generate`:

```nix
{ config, lib, pkgs, ... }:
let
  cfg = config.funkcia.hm.gui.foo;
  toml = pkgs.formats.toml { };   # or json { }, yaml { }, ini { }, ...
in
{
  options.funkcia.hm.gui.foo = {
    settings = lib.mkOption {
      type = toml.type;           # validates the attrset
      default = { };
      description = "Config for foo.";
    };
  };

  config = lib.mkIf cfg.enable {
    xdg.configFile."foo/config.toml".source = toml.generate "foo-config.toml" cfg.settings;
  };
}
```

`.type` and `.generate` describe the **same** value, so they stay in sync automatically.

## Step 4: Know the conversions you get for free

`pkgs.formats.<fmt>` (backed by `lib.generators.toTOML`/`json2x` etc.) convert:

- nested attrset → table (`{ theme.mode = "dark"; }` → `[theme]\nmode = "dark"`)
- list of attrsets → array of tables (`[ { name = "clock"; } ]` → `[[...]]`)
- lists of scalars / basic scalars → plain values

## Step 5: Verify with `evalModules`

Test the option's type is actually enforced and generation works. Do NOT just trust the
standalone `.type.check` (it can be lenient); run it through the module system:

```bash
nix eval --json --impure --expr '
let
  pkgs = import (builtins.getFlake (toString ./.)).inputs.nixpkgs {};
  lib = pkgs.lib;
  res = lib.evalModules {
    modules = [
      { options.xdg.configFile = lib.mkOption { type = lib.types.attrsOf lib.types.anything; default = {}; }; }
      ./path/to/module.nix
      { funkcia.hm.gui.foo = { enable = true; settings = { theme.mode = "dark"; }; }; }
    ];
    specialArgs = { inherit pkgs; osConfig = { programs.foo.enable = true; }; };
  };
in (builtins.toJSON (builtins.mapAttrs (k: v: v.text or (builtins.readFile v.source)) res.config.xdg.configFile))'
```

Check it produces the expected output and that invalid values fail.

## Checklist (use this every time)

- [ ] Searched for an existing option / format before writing.
- [ ] Used the most specific `lib.types.*` available — not a generic fallback.
- [ ] Used `pkgs.formats.<fmt> {}.type` + `.generate` as a pair when a format applies.
- [ ] Confirmed `mkMerge`/`mapAttrs'` structure is nested correctly (bad nesting is the #1 silent bug).
- [ ] Verified via `evalModules`, not just a happy-path hunch.
