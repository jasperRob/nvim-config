" ########## sublimemonokai Settings ##########
"
" Any settings regarding the sublimemonokai 
" plugin go here.
"

if 1
	" Full term colours
	set termguicolors
	" Use Italic text
	let g:sublimemonokai_term_italic = 1

	"Java
	let java_comment_strings=1
	let java_highlight_functions=1
	let java_highlight_java_lang_ids=1

	"GoLang
	let g:go_highlight_format_strings = 1
	let g:go_highlight_function_arguments = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_types = 1

	let g:go_highlight_extra_types = 1
	let g:go_highlight_fields = 1
	let g:go_highlight_generate_tags = 1
	let g:go_highlight_variable_assignments = 1
	let g:go_highlight_variable_declarations = 1

endif

