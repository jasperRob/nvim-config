-- keymapper function
local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, {
    noremap = true,
    silent = true,
  })
end

-- nerdtree
key_mapper('n', '<C-n>', ':call g:ToggleNERDTreeBar()')

-- lsp
key_mapper('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', '<c-]>', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

-- general
key_mapper('n', '<leader>q', ':q<CR>')
key_mapper('n', '<leader>w', ':w<CR>')

key_mapper('n', 'Y', 'y$')

key_mapper('n', 'n', 'nzzzv')
key_mapper('n', 'N', 'Nzzzv')
key_mapper('n', 'J', 'mxJ`z')

key_mapper('i', ',', ',<c-g>u')
key_mapper('i', '.', '.<c-g>u')
key_mapper('i', '!', '!<c-g>u')
key_mapper('i', '?', '?<c-g>u')

key_mapper('v', 'J', ":m'>+1<Cr>gv=gv")
key_mapper('v', 'K', ":m'<-2<Cr>gv=gv")
key_mapper('i', '<C-j>', "<esc>:m .+1<Cr>==")
key_mapper('i', '<C-k>', "<esc>:m .-2<Cr>==")

-- arrow key remaps
key_mapper('n', '<Up>', '<Nop>')
key_mapper('n', '<Down>', '<Nop>')
key_mapper('n', '<Left>', '<Nop>')
key_mapper('n', '<Right>', '<Nop>')

key_mapper('i', '<Up>', '<Nop>')
key_mapper('i', '<Down>', '<Nop>')
key_mapper('i', '<Left>', '<Nop>')
key_mapper('i', '<Right>', '<Nop>')


