" ##########  FZF Settings ##########
"
" Any settings regarding the FZF plugin go here.
"

" let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" let g:fzf_preview_window = []
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Default command for FZF Files search
let $FZF_DEFAULT_COMMAND='rg --files'

" RipGrep search IN file
command! -bang -nargs=* Rg
	\ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
	\ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Tag word under cursor
fu! FzfTagsCurrentWord()
    let currentWord = expand('<cword>')
    if len(currentWord) > 0
        call fzf#vim#tags({'options': '-q ' . currentWord})
    else
        execute ':Tags'
    endif
endfu
