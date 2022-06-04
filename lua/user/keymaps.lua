-- map options
local opts = { noremap = true }

-- keymapper functions
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

-- general
nkeymap('<leader>q', ':q<CR>')
nkeymap('<leader>w', ':w<CR>')

nkeymap('Y', 'y$')

nkeymap('n', 'nzzzv')
nkeymap('N', 'Nzzzv')
nkeymap('J', 'mxJ`z')

keymap('i', ',', ',<c-g>u', opts)
keymap('i', '.', '.<c-g>u', opts)
keymap('i', '!', '!<c-g>u', opts)
keymap('i', '?', '?<c-g>u', opts)

keymap('v', 'J', ":m'>+1<Cr>gv=gv", opts)
keymap('v', 'K', ":m'<-2<Cr>gv=gv", opts)
keymap('i', '<C-j>', "<esc>:m .+1<Cr>==", opts)
keymap('i', '<C-k>', "<esc>:m .-2<Cr>==", opts)

-- arrow key remaps
nkeymap('<Up>', '<Nop>')
nkeymap('<Down>', '<Nop>')
nkeymap('<Left>', '<Nop>')
nkeymap('<Right>', '<Nop>')

keymap('i', '<Up>', '<Nop>', opts)
keymap('i', '<Down>', '<Nop>', opts)
keymap('i', '<Left>', '<Nop>', opts)
keymap('i', '<Right>', '<Nop>', opts)

-- buffers
nkeymap('<leader>ls', ':Buffers<CR>')

-- nerdtree
nkeymap('<C-n>', ':NERDTreeToggle<CR>')

-- telescope
nkeymap('<C-p>', ':Telescope find_files<CR>')
nkeymap('<C-f>', ':Telescope live_grep<CR>')

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
nkeymap('<space>a', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<space>r', ':lua vim.lsp.buf.rename()<cr>')

