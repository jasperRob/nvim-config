call plug#begin()

"  ########## Plugins currently in use ##########
" Plug 'neovim/nvim-lspconfig'
" Plug 'mfussenegger/nvim-jdtls'
Plug 'tpope/vim-eunuch'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'szw/vim-maximizer'
Plug 'jesseleite/vim-agriculture'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'uiiaoo/java-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'hoob3rt/lualine.nvim'

"  ########## Colour Themes ##########
Plug 'tomasiser/vim-code-dark'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'crusoexia/vim-monokai'
Plug 'junegunn/seoul256.vim'

"  ########## Plugins no longer in use ##########
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'
" Plug 'frazrepo/vim-rainbow'

call plug#end()


" ########## Sourcing other configs ##########

source ~/.config/nvim/plug-config/coc.vim
source ~/.config/nvim/plug-config/fzf.vim
source ~/.config/nvim/plug-config/nerdtree.vim
source ~/.config/nvim/plug-config/rainbow_parentheses.vim
source ~/.config/nvim/plug-config/sublimemonokai.vim
source ~/.config/nvim/plug-config/treesitter.vim
source ~/.config/nvim/plug-config/vim-print.vim
source ~/.config/nvim/plug-config/vim-fugitive.vim
" source ~/.config/nvim/plug-config/vimspector.vim
source ~/.config/nvim/syntax.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/cosmetics.vim
source ~/.config/nvim/commands.vim
" source ~/.config/nvim/lsp.vim

