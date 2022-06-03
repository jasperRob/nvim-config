print("In Options")
-- map leader
vim.g.mapleader = ','
-- vim commands
--
-- main neovim settings
vim.wo.relativenumber = true
vim.opt.swapfile = false

-- indentation settings
--vim.bo.autoindent = true
--vim.o.expandtab = false
--vim.o.tabstop = 4
--vim.o.shiftwidth = 4
vim.bo.autoindent = true
vim.bo.expandtab = false
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4

-- set colorscheme
vim.g.colors_name = 'molokai'
