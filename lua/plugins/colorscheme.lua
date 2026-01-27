return {
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'darker',
      }
      require('onedark').load()
    end,
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme 'github_dark'
    -- end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    -- config = function()
    --   vim.cmd.colorscheme 'catppuccin'
    -- end,
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('kanagawa').setup {
        styles = {
          comments = { italic = false },
        },
      }
      -- vim.cmd.colorscheme 'kanagawa'
    end,
  },
}
