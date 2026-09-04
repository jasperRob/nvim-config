local black_roots = {}

local function uses_black(ctx)
  local root = vim.fs.root(ctx.buf, { 'pyproject.toml', 'setup.cfg', '.git' })
  if not root then
    return false
  end
  if black_roots[root] ~= nil then
    return black_roots[root]
  end

  local found = false
  local pyproject = root .. '/pyproject.toml'
  if vim.uv.fs_stat(pyproject) then
    local text = table.concat(vim.fn.readfile(pyproject), '\n')
    found = text:find '%[tool%.black%]' ~= nil and text:find '%[tool%.ruff%.format%]' == nil
  end
  black_roots[root] = found
  return found
end

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    if not vim.g.format_on_save_enabled then
      return nil
    end
    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end
  end,
  formatters = {
    prettier = {
      prepend_args = function(_, ctx)
        if vim.bo[ctx.buf].filetype == 'markdown' then
          return { '--prose-wrap', 'always', '--print-width', '80' }
        end
        return {}
      end,
    },
    isort = {
      condition = function(_, ctx)
        return uses_black(ctx)
      end,
    },
    black = {
      condition = function(_, ctx)
        return uses_black(ctx)
      end,
    },
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    markdown = { 'prettier' },
    python = { 'isort', 'black', 'ruff_organize_imports', 'ruff_format' },
  },
}

vim.keymap.set('', '<leader>f', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat buffer' })

vim.keymap.set('n', '<leader>tf', function()
  vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
  local state = vim.g.format_on_save_enabled and 'enabled' or 'disabled'
  vim.notify('Format on save ' .. state, vim.log.levels.INFO)
end, { desc = '[T]oggle [F]ormat on save' })
