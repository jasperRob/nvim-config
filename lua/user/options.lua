-- main neovim settings
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.swapfile = false

-- set colorscheme
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd [[colorscheme palenight]]

-- indentation settings
vim.opt.autoindent = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
-- autocommands
vim.cmd [[autocmd FileType javascript setlocal shiftwidth=2 tabstop=2]]
vim.cmd [[autocmd FileType xml setlocal shiftwidth=2 tabstop=2]]
