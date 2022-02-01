" ########## Syntax Settings ##########
"
" This is where syntax setting go.
"

syntax on
let g:rg_binary = '/usr/local/bin/'
syn match   droolsType  "\<([A-Z])\w+"

function! CheckRulesOnCurrentFile()
	let file_name = expand("%")
	let current_dir = getcwd() . ":"
	let project = matchstr(current_dir, "(?<=\/projects\/genny\/).*(?=(\/|\:))")
	" echo project
	" silent execute docker run -v ~/projects/genny/prj_internmatch/rules:/rules gennyproject/checkrules -d file_name
endfunction

autocmd BufWritePost *.drl call CheckRulesOnCurrentFile()


