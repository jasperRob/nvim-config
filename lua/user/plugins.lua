-- init plugin manager
require('packer').startup(function()

	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- sidebar
	use 'preservim/nerdtree'

	-- git sidebar status
	use 'lewis6991/gitsigns.nvim'

	-- buffer tabline
	use {
		'akinsho/bufferline.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true,
		},
	}

	-- status line
	use {
		'hoob3rt/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			opt = true,
		},
	}

	-- fzf native (telescope extension)
	-- use {
	-- 	'nvim-telescope/telescope-fzf-native.nvim',
	-- 	run = 'make',
	-- }
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- IDE
	use 'nvim-treesitter/nvim-treesitter'

	---- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	-- Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	-- Plug 'junegunn/fzf.vim'
	-- Plug 'puremourning/vimspector'
	-- "
	-- "  Quality Of Life
	-- Plug 'tpope/vim-eunuch'
	-- Plug 'szw/vim-maximizer'
	-- Plug 'jesseleite/vim-agriculture'
	-- Plug 'tpope/vim-fugitive'
	-- Plug 'tpope/vim-surround'
	-- Plug 'tpope/vim-commentary'
	-- Plug 'uiiaoo/java-syntax.vim'
	-- Plug 'pangloss/vim-javascript'
	-- Plug 'sheerun/vim-polyglot'
	-- Plug 'junegunn/rainbow_parentheses.vim'
	-- Plug 'ryanoasis/vim-devicons'
	-- Plug 'hoob3rt/lualine.nvim'


	---- completion
	-- use {
	--   'hrsh7th/nvim-cmp',
	--   requires = {
	--     'hrsh7th/cmp-buffer',
	--     'hrsh7th/cmp-path',
	--     'hrsh7th/cmp-nvim-lua',
	--     'hrsh7th/cmp-nvim-lsp',
	--   },
	-- }

	---- snippets
	-- use 'rafamadriz/friendly-snippets'
	-- use 'L3MON4D3/LuaSnip'
	-- use 'saadparwaiz1/cmp_luasnip'

	---- display indentation lines
	-- use 'lukas-reineke/indent-blankline.nvim'

	---- helpers / misc plugins
	-- use 'jiangmiao/auto-pairs'
	-- use 'tpope/vim-commentary'
	-- use 'tpope/vim-surround'

	---- colorschemes
	-- main colorscheme
	--use 'bluz71/vim-nightfly-guicolors'
	--use 'tomasiser/vim-code-dark'
	use 'patstockwell/vim-monokai-tasty'
	use 'ErichDonGubler/vim-sublime-monokai'
	--use 'crusoexia/vim-monokai'
	--use 'EdenEast/nightfox.nvim'
	--use 'junegunn/seoul256.vim'

	-- vimdiff colorscheme
	-- use 'nanotech/jellybeans.vim'
end)
