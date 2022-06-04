print("In Options")
-- map leader
vim.g.mapleader = ','
-- vim commands
--
-- main neovim settings
vim.opt.relativenumber = true
vim.opt.swapfile = false

-- indentation settings
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- set colorscheme
vim.opt.termguicolors = true
vim.cmd [[colorscheme monokai]]
