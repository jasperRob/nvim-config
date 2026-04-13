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
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    markdown = { 'prettier' },
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
