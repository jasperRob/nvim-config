-- map options
local opts = { noremap = true, silent = true }

-- keymapper functions
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

local function ikeymap(key, map)
	keymap('i', key, map, opts)
end

local function vkeymap(key, map)
	keymap('v', key, map, opts)
end

-- set leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- save and quit
nkeymap('<leader>q', ':q<CR>')
nkeymap('<leader>w', ':w<CR>')

nkeymap('Y', 'y$')

-- centre when searching
nkeymap('n', 'nzzzv')
nkeymap('N', 'Nzzzv')
nkeymap('J', 'mxJ`z')

ikeymap(',', ',<c-g>u')
ikeymap('.', '.<c-g>u')
ikeymap('!', '!<c-g>u')
ikeymap('?', '?<c-g>u')

-- moving lines
vkeymap('J', ":m'>+1<Cr>gv=gv")
vkeymap('K', ":m'<-2<Cr>gv=gv")
ikeymap('<C-j>', "<esc>:m .+1<Cr>==")
ikeymap('<C-k>', "<esc>:m .-2<Cr>==")

-- retain yank
vkeymap('p', '"_dP')

-- indent
-- vkeymap('<', '<gv')
-- vkeymap('>', '<gv')

-- window navigation
nkeymap('<C-h>', '<C-w>h')
nkeymap('<C-j>', '<C-w>j')
nkeymap('<C-k>', '<C-w>k')
nkeymap('<C-l>', '<C-w>l')

-- arrow key remaps
nkeymap('<Up>', '<Nop>')
nkeymap('<Down>', '<Nop>')
nkeymap('<Left>', '<Nop>')
nkeymap('<Right>', '<Nop>')

ikeymap('<Up>', '<Nop>')
ikeymap('<Down>', '<Nop>')
ikeymap('<Left>', '<Nop>')
ikeymap('<Right>', '<Nop>')

-- nerdtree
nkeymap('<C-n>', ':NERDTreeToggle<CR>')

-- telescope
nkeymap('<C-p>', ':Telescope find_files<CR>')
nkeymap('<C-f>', ':Telescope live_grep<CR>')
nkeymap('<leader>b', ':Telescope buffers<CR>')
nkeymap('<leader>h', ':Telescope help_tags<CR>')

-- lsp
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-s>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>a', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>r', ':lua vim.lsp.buf.rename()<cr>')

