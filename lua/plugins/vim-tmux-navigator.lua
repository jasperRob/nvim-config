return {
  'christoomey/vim-tmux-navigator', -- Seamless navigation between tmux panes and vim splits
  config = function()
    -- Enable terminal mode navigation
    vim.keymap.set('t', '<C-h>', '<C-\\><C-n>:TmuxNavigateLeft<CR>', { silent = true })
    vim.keymap.set('t', '<C-l>', '<C-\\><C-n>:TmuxNavigateRight<CR>', { silent = true })
    vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:TmuxNavigateDown<CR>', { silent = true })
    vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:TmuxNavigateUp<CR>', { silent = true })
  end,
}
