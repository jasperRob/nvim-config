" ########## Vim Print Settings ##########
"
" Any settings regarding the Vim Print 
" plugin go here.
"
" NOTE: This is not an external plugin,
" it is all my own scripting (Jasper)
"

let filetype_print_statements = {
	\'java': 'System.out.println();',
	\'drools': 'System.out.println();',
	\'python': 'print()',
	\'javascript': 'console.log()',
	\'cpp': 'cout <<  ;'
\}

function! IsCurrentLineEmpty()
    return IsLineEmpty(getline('.'))
endfu

function! IsLineEmpty(line)
    return match(a:line, "^\\s*$") != -1
endfu

" Function to create a print statement on a new line
function! InsertPrintStatement()
	let current_filetype = &filetype
	if has_key(g:filetype_print_statements, l:current_filetype)
		let text = get(g:filetype_print_statements, l:current_filetype)
		if IsCurrentLineEmpty()
			execute "normal! A" . text
		else
			execute "normal! o" . text
		endif
		if getline('.')[col('.')-1] == ';'
			normal! h
		endif
		" startinsert
	else
		echo "Filetype " . l:current_filetype . " not in print statement dictionary"
	endif
endfunction

" Function to create a print statement based arround the word under cursor
function! InsertPrintVariable()
	let current_filetype = &filetype
	if has_key(g:filetype_print_statements, l:current_filetype)
		let text = get(g:filetype_print_statements, l:current_filetype)
		execute "normal! ye"
		let var_name = @"
		if !IsCurrentLineEmpty()
			execute "normal! o" . text
			if getline('.')[col('.')-1] == ';'
				normal! h
			endif
			execute "normal! i\"" . var_name ." = \" + " . var_name
		endif
	else
		echo "Filetype " . l:current_filetype . " not in print statement dictionary"
	endif
endfunction

nnoremap <Leader>p :call InsertPrintStatement()<Cr>
nnoremap yp :call InsertPrintVariable()<Cr>

