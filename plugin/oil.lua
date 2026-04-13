require('oil').setup {
  default_file_explorer = true,
  columns = { 'icon' },
  view_options = { show_hidden = true },
}

vim.keymap.set('n', '<leader>e', '<cmd>Oil<cr>', { desc = 'Open Oil file explorer' })
