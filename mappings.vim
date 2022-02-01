" ##########  Key Mappings ##########
"
" This is where all remapping settings
" for NeoVim should be kept. This includes
" any functions used in the process.
"


" Function to toggle relative line numbers
function! g:ToggleRelativeLineNumbers()
	if &rnu == 1
		set nornu
	else
		set rnu
	endif
endfunction

nnoremap <silent><C-l> :call g:ToggleRelativeLineNumbers()<cr>

nmap <leader>r :NERDTreeFind<cr>


" Plugins
nmap <C-p> :Files<Cr>
nmap <C-f> :Rg<Cr>
nmap <C-n> :call g:ToggleNERDTreeBar()<Cr>
nnoremap <leader>ls :Buffers<CR>

" Maximiser
" nnoremap <C-m> :MaximizerToggle<CR>

" Quickfix
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <C-q> :call ToggleQuickFix()<cr>
nnoremap <C-j> :cnext<Cr>
nnoremap <C-k> :cprev<Cr>


" use <tab> for trigger completion and navigate to the next complete item
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" Terminal
nnoremap <leader>t :split term://zsh<CR>
tnoremap <Tab> <Tab>
" tnoremap <C-i> <C-\><C-n>


" ########## VIMSPECTOR ##########

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" ################################

" Brackets
" inoremap <silent>{<Cr> {<Cr>}<Esc><S-o><Tab>
" inoremap <silent>{<Cr> {<Cr>}<Esc><S-o>
" autocmd FileType drools inoremap <silent>{<Cr> {<Cr>}<Esc><S-o><Tab>


" ########## Beautiful Maps ##########

nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mxJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

vnoremap J :m'>+1<Cr>gv=gv
vnoremap K :m'<-2<Cr>gv=gv
inoremap <C-j> <esc>:m .+1<Cr>==
inoremap <C-k> <esc>:m .-2<Cr>==

" ################################


" Turn off arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

