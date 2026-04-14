-- nvim-treesitter v1.x API (Neovim 0.12+)
-- require('nvim-treesitter.configs') no longer exists in v1.x.
-- Treesitter highlighting uses vim.treesitter (built-in Neovim).

local languages = {
  'bash',
  'c',
  'diff',
  'gitcommit',
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
}

vim.schedule(function()
  local ts_install = require('nvim-treesitter.install')
  local ts_config = require('nvim-treesitter.config')

  -- Force-install any languages whose query symlink is missing.
  -- update() only reinstalls when the parser revision changes, so it misses
  -- the case where a parser binary exists but the query symlink was deleted.
  local queries_dir = ts_config.get_install_dir('queries')
  local missing = vim.tbl_filter(function(lang)
    return vim.uv.fs_stat(vim.fs.joinpath(queries_dir, lang)) == nil
  end, languages)

  if #missing > 0 then
    ts_install.install(missing, { force = true })
  end

  -- Update any parsers whose revision is behind the current nvim-treesitter.
  ts_install.update(languages)
end)

-- Enable treesitter highlighting and indentation for all supported filetypes
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    if pcall(vim.treesitter.start, ev.buf) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
