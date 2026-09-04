vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:TmuxNavigateRight<CR>', { silent = true })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:TmuxNavigateUp<CR>', { silent = true })

-- Buffer-local overrides for terminal buffers (beats snacks.nvim/claudecode.nvim buffer-local maps)
vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function(ev)
    local buf = ev.buf
    vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:TmuxNavigateLeft<CR>',  { silent = true, buffer = buf })
    vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:TmuxNavigateRight<CR>', { silent = true, buffer = buf })
    vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:TmuxNavigateDown<CR>',  { silent = true, buffer = buf })
    vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:TmuxNavigateUp<CR>',    { silent = true, buffer = buf })
  end,
})
