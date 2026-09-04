# Neovim Config

My Neovim config. Derived from
[kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Uses the built-in
`vim.pack` package manager (Neovim 0.12+).

## Requirements

### Core

- Neovim 0.12+
- [Nerd Font](https://www.nerdfonts.com/) — set in your terminal for icons
- `git`
- `make` + a C compiler — required to build `telescope-fzf-native` and LuaSnip's jsregexp module

### Language toolchains

These are required by Mason-managed LSPs, formatters, and debuggers:

| Toolchain | Used by |
| --------- | ------- |
| **Go** | `delve` debugger (Go DAP) |
| **Node.js** | `vtsls` (TypeScript LSP), `prettier` formatter, `markdownlint-cli2` linter |
| **Python** | `pyright` (Python LSP), `debugpy` (Python DAP) |

Mason installs the LSP servers and debuggers automatically, but the underlying runtimes must already be present on the host.

### Optional

- `ripgrep` — live grep in Telescope (`<leader>sg`)
- [Claude Code CLI](https://claude.ai/code) — required for the `claudecode.nvim` integration (`<leader>ac`)

## Installation

```sh
# Back up any existing config
mv ~/.config/nvim ~/.config/nvim.bak

# Clone this repo
git clone https://github.com/jasperRob/nvim ~/.config/nvim

# Open Neovim — vim.pack installs plugins automatically on first launch
nvim
```

Mason will install configured LSP servers and tools (pyright, vtsls, lua_ls,
stylua) on first open.

## Structure

```
~/.config/nvim/
├── init.lua              # Core options and keymaps
├── plugin/               # Per-plugin config (vim.pack format)
├── lua/plugins/          # Legacy lazy.nvim specs (reference only)
├── nvim-pack-lock.json   # Pinned plugin revisions
└── lazy-lock.json        # Legacy lock file (do not modify)
```

## Plugins

| Plugin                                                                | Purpose                           |
| --------------------------------------------------------------------- | --------------------------------- |
| [blink.cmp](https://github.com/saghen/blink.cmp) + LuaSnip            | Completion + snippets             |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) + Mason    | LSP setup and server management   |
| [conform.nvim](https://github.com/stevearc/conform.nvim)              | Formatting (stylua, prettier)     |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint)                | Linting                           |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and parsing   |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)    | Fuzzy finding                     |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)           | Git hunk navigation and staging   |
| [diffview.nvim](https://github.com/sindrets/diffview.nvim)            | Git diff and file history         |
| [flash.nvim](https://github.com/folke/flash.nvim)                     | Fast motion/navigation            |
| [oil.nvim](https://github.com/stevearc/oil.nvim)                      | File explorer as a buffer         |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim)           | Claude Code integration           |
| [nvim-dap](https://github.com/mfussenegger/nvim-dap) + dap-ui         | Debugger (Go, Python)             |
| [onedark.nvim](https://github.com/navarasu/onedark.nvim)              | Colorscheme                       |
| [which-key.nvim](https://github.com/folke/which-key.nvim)             | Keymap hints                      |
| [mini.nvim](https://github.com/echasnovski/mini.nvim)                 | Statusline, icons, misc utilities |

## Keymaps

Leader key: `Space`

### General

| Key           | Action                 |
| ------------- | ---------------------- |
| `<leader>w`   | Save buffer            |
| `<leader>v`   | Open vertical split    |
| `<C-h/j/k/l>` | Navigate splits        |
| `<Esc>`       | Clear search highlight |

### Search (Telescope)

| Key                | Action                            |
| ------------------ | --------------------------------- |
| `<leader>sf`       | Find files                        |
| `<leader>sg`       | Live grep                         |
| `<leader>sw`       | Grep current word                 |
| `<leader>sa`       | Find all files (including hidden) |
| `<leader>sd`       | Search diagnostics                |
| `<leader>sh`       | Search help tags                  |
| `<leader>sk`       | Search keymaps                    |
| `<leader>sr`       | Resume last search                |
| `<leader>s.`       | Recent files                      |
| `<leader><leader>` | Open buffers                      |
| `<leader>/`        | Fuzzy search current buffer       |
| `<leader>s/`       | Grep open files                   |
| `<leader>sn`       | Search Neovim config files        |

### LSP

| Key          | Action                   |
| ------------ | ------------------------ |
| `grn`        | Rename symbol            |
| `gra`        | Code action              |
| `grr`        | References               |
| `gri`        | Implementations          |
| `grd`        | Definition               |
| `grD`        | Declaration              |
| `grt`        | Type definition          |
| `gO`         | Document symbols         |
| `gW`         | Workspace symbols        |
| `<leader>xd` | Show diagnostic float    |
| `<leader>xq` | Diagnostic quickfix list |
| `<leader>th` | Toggle inlay hints       |

### Formatting

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>f`  | Format buffer         |
| `<leader>tf` | Toggle format on save |

### Git

| Key          | Action                      |
| ------------ | --------------------------- |
| `]c` / `[c`  | Next / prev git hunk        |
| `<leader>hs` | Stage hunk                  |
| `<leader>hr` | Reset hunk                  |
| `<leader>hS` | Stage buffer                |
| `<leader>hR` | Reset buffer                |
| `<leader>hp` | Preview hunk                |
| `<leader>hb` | Blame line                  |
| `<leader>hd` | Diff against index          |
| `<leader>hD` | Diff against last commit    |
| `<leader>tb` | Toggle inline blame         |
| `<leader>gd` | Diffview (index)            |
| `<leader>gD` | Diffview (last commit)      |
| `<leader>go` | Diffview (vs origin)        |
| `<leader>gh` | File history (repo)         |
| `<leader>gH` | File history (current file) |
| `<leader>gc` | Close diffview              |

### Claude Code

| Key          | Action                            |
| ------------ | --------------------------------- |
| `<leader>ac` | Toggle Claude                     |
| `<leader>af` | Focus Claude                      |
| `<leader>ar` | Resume Claude session             |
| `<leader>aC` | Continue Claude session           |
| `<leader>am` | Select model                      |
| `<leader>ab` | Add current buffer                |
| `<leader>as` | Send selection to Claude (visual) |
| `<leader>aa` | Accept diff                       |
| `<leader>ad` | Deny diff                         |

### Visual Mode

| Key       | Action                        |
| --------- | ----------------------------- |
| `K` / `J` | Move selected lines up / down |
| `<` / `>` | Indent and keep selection     |
