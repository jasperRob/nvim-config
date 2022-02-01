" ########## Rainbow Parenthesis Settings ##########
"
" Any settings regarding the Rainbow 
" Parenthesis plugin go here.
"

let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
" List of colors that you do not want. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234, 11]
au bufenter * RainbowParentheses

