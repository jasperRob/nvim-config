-- nvim-treesitter v1.x API (Neovim 0.12+)
-- require('nvim-treesitter.configs') no longer exists in v1.x.
-- Treesitter highlighting uses vim.treesitter (built-in Neovim).

vim.schedule(function()
  -- Install any missing parsers from our list
  require('nvim-treesitter.install').update({
    'bash',
    'c',
    'diff',
    'html',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'query',
    'vim',
    'vimdoc',
    'javascript',
    'json',
    'python',
    'tsx',
    'typescript',
    'regex',
    'terraform',
  })
  -- Update any installed parsers that are behind the current nvim-treesitter
  -- queries (prevents "Invalid node type" errors after plugin updates)
  vim.cmd 'TSUpdate'
end)

-- Enable treesitter highlighting and indentation for all supported filetypes
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
