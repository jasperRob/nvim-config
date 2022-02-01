" ##########  Cosmetic Settings ##########
"
" This is where all settings regarding the
" look and feel of NeoVim should be kept.
"

set nocompatible
set path+=**
set wildmenu
set number relativenumber

syntax on
colorscheme monokai
set termguicolors
"
" colorscheme sublimemonokai
" colorscheme codedark
" colorscheme vim-monokai-tasty
" colorscheme seoul256-light

highlight LineNr ctermfg=grey

highlight clear SignColumn

" highlight TabLine ctermfg=Black ctermbg=White
" highlight TabLineSel ctermfg=White ctermbg=Black

" INDENT TAB SETTINGS
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4

autocmd FileType dart setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
