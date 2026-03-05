return {
  'sindrets/diffview.nvim',
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = '[G]it [d]iff (index)' },
    { '<leader>gD', '<cmd>DiffviewOpen HEAD~1<cr>', desc = '[G]it [D]iff last commit' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [h]istory (repo)' },
    { '<leader>gH', '<cmd>DiffviewFileHistory %<cr>', desc = '[G]it [H]istory (file)' },
    { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = '[G]it [c]lose diffview' },
  },
}
