" ########## NERDTree Settings ##########
"
" Any settings regarding the NERDTree 
" plugin go here.
"

let g:NERDTreeWinSize=45

" Toggle nerd tree and open at file location
function! g:ToggleNERDTreeBar()
	if ( exists("g:NERDTree") && g:NERDTree.IsOpen() ) || ( @% == "" )
		NERDTreeToggle
	else
		NERDTreeFind
	endif
endfunction

