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

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- IDE
	use 'nvim-treesitter/nvim-treesitter'

	---- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	-- Plug 'puremourning/vimspector'

	---- completion
	use {
	  'hrsh7th/nvim-cmp',
	  requires = {
	    'hrsh7th/cmp-buffer',
	    'hrsh7th/cmp-path',
	    'hrsh7th/cmp-nvim-lua',
	    'hrsh7th/cmp-nvim-lsp',
	  },
	}

	---- snippets
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	-- git
	-- use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'

	---- display indentation lines
	-- use 'lukas-reineke/indent-blankline.nvim'

	---- helpers / misc plugins
	use 'windwp/nvim-autopairs'
	use 'tpope/vim-commentary'
	use 'tpope/vim-surround'

	-- Plug 'szw/vim-maximizer'
	-- use 'junegunn/rainbow_parentheses.vim'

	---- colorschemes
	-- main colorscheme
	use 'bluz71/vim-nightfly-guicolors'
	use 'ErichDonGubler/vim-sublime-monokai'
	use 'tomasiser/vim-code-dark'
	use 'patstockwell/vim-monokai-tasty'
	use 'crusoexia/vim-monokai'
	use 'EdenEast/nightfox.nvim'
	-- use 'junegunn/seoul256.vim'
	use 'drewtempelmeyer/palenight.vim'

	-- vimdiff colorscheme
	use 'nanotech/jellybeans.vim'
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
