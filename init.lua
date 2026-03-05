-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Use true colours
vim.opt.termguicolors = true

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Tab settings: use 2 spaces by default
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Language-specific indentation
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python', 'java', 'php' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Golang uses tabs instead of spaces
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

-- Need to override markdown for some reason
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Save current buffer
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save buffer' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>xd', vim.diagnostic.open_float, { desc = 'Show [D]iagnostic float' })

-- Open vertical split
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Open vertical split' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Also enable split navigation in terminal mode
-- vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Move selected lines up/down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- Remain selected after indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Centre on next search item
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- Notes
vim.keymap.set('n', '<leader>nd', function()
  vim.fn.jobstart('daily-note', { detach = true })
end, { desc = 'Open Daily Note' })
vim.keymap.set('n', '<leader>nn', function()
  local current_file = vim.fn.expand '%:p'
  local result = vim.fn.system { 'next-note', '--print', current_file }
  local next_file = vim.trim(result)
  if next_file ~= '' and not next_file:match '^No next' and not next_file:match '^Error' and not next_file:match '^Usage' then
    vim.cmd('edit ' .. vim.fn.fnameescape(next_file))
  else
    print(next_file)
  end
end, { desc = 'Open Next Note' })
vim.keymap.set('n', '<leader>np', function()
  local current_file = vim.fn.expand '%:p'
  local result = vim.fn.system { 'prev-note', '--print', current_file }
  local prev_file = vim.trim(result)
  if prev_file ~= '' and not prev_file:match '^No prev' and not prev_file:match '^Error' and not prev_file:match '^Usage' then
    vim.cmd('edit ' .. vim.fn.fnameescape(prev_file))
  else
    print(prev_file)
  end
end, { desc = 'Open Prev Note' })
vim.keymap.set('n', '<leader>nu', ':!push-notes<CR>', { desc = 'Upload to Notes Repo' })

-- Yank full file path to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand '%:p')
  vim.notify('Copied full path: ' .. vim.fn.expand '%:p', vim.log.levels.INFO, { title = 'File Path' })
end, { desc = 'Copy full file path' })

-- Yank relative file path to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>yr', function()
  vim.fn.setreg('+', vim.fn.expand '%:.')
  vim.notify('Copied relative path: ' .. vim.fn.expand '%:.', vim.log.levels.INFO, { title = 'File Path' })
end, { desc = 'Copy relative file path' })

-- Yanking method name for Pytest
local function yank_pytest(debug)
  local node = vim.treesitter.get_node()
  local buf = vim.api.nvim_get_current_buf()
  local rel_filepath = vim.fn.expand '%:.'
  if rel_filepath:find 'kogan3/' ~= nil then
    rel_filepath = string.sub(rel_filepath, 8)
  end

  local symbol = ''
  if node then
    symbol = vim.treesitter.get_node_text(node, buf):gsub('\n', ' ')
  end
  local str = string.format('./shortcuts.sh %s "%s" -k "%s"', debug and 'vscode_tests' or 'test', rel_filepath, symbol)
  vim.fn.setreg('"', str)
  vim.fn.setreg('+', str)
  print('Pytest: ' .. str)
end

vim.keymap.set('n', '<leader>dn', function()
  yank_pytest(false)
end, { desc = 'Pytest Copy Command' })

vim.keymap.set('n', '<leader>dd', function()
  yank_pytest(true)
end, { desc = 'Pytest Copy Debug Command' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  -- Import all plugin configurations from the plugins directory
  { import = 'plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
