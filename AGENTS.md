# Agent Guidelines

## Repo structure

- `init.lua` — Core Neovim options and keymaps. No plugin config here.
- `plugin/` — Per-plugin configuration files using the vim.pack format (Neovim 0.12+ built-in package manager). One file per plugin.
- `lua/plugins/` — Legacy lazy.nvim plugin specs (kept for reference; do not add new plugins here).
- `nvim-pack-lock.json` — Lock file for vim.pack plugins. Commit any changes to this alongside plugin changes.
- `lazy-lock.json` — Legacy lazy.nvim lock file. Do not modify.

## Adding or modifying plugins

- New plugin configs go in `plugin/<plugin-name>.lua`, mirroring the existing files in that directory.
- Do not add new entries to `lua/plugins/` — that directory is the old lazy.nvim setup.
- After adding or updating a plugin, update `nvim-pack-lock.json` with the new rev.

## Documentation

- The `README.md` is intentionally minimal. Only update it if there is a significant structural change to the config.
- Do not add per-plugin documentation to README.md.

## Style

- Lua only — no Vimscript.
- Keep plugin configs self-contained in their `plugin/` file.
- Follow the conventions of existing `plugin/` files (require the plugin, call setup, define keymaps in the same file).
