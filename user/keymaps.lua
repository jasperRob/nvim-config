-- map options
local opts = { noremap = true }

-- keymapper functions
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

-- nerdtree
-- keymap('n', '<C-n>', ':call g:ToggleNERDTreeBar()', opts)
keymap('n', '<C-n>', ':NERDTreeToggle<CR>', opts)

-- lsp
keymap('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', '<c-]>', ':lua vim.lsp.buf.definition()<CR>', opts)
keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts)

-- general
keymap('n', '<leader>q', ':q<CR>', opts)
keymap('n', '<leader>w', ':w<CR>', opts)

keymap('n', 'Y', 'y$', opts)

keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)
keymap('n', 'J', 'mxJ`z', opts)

keymap('i', ',', ',<c-g>u', opts)
keymap('i', '.', '.<c-g>u', opts)
keymap('i', '!', '!<c-g>u', opts)
keymap('i', '?', '?<c-g>u', opts)

keymap('v', 'J', ":m'>+1<Cr>gv=gv", opts)
keymap('v', 'K', ":m'<-2<Cr>gv=gv", opts)
keymap('i', '<C-j>', "<esc>:m .+1<Cr>==", opts)
keymap('i', '<C-k>', "<esc>:m .-2<Cr>==", opts)

-- arrow key remaps
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)

keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)


-- lsp
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

