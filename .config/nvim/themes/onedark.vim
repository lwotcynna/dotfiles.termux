hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
colorscheme onedark
set termguicolors

" lightline statusline
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }

" airline statusline
let g:airline_theme='onedark'


"" onedark.vim override: Don't set a background color when running in a terminal;
"if (has("autocmd") && !has("gui_running"))
"  augroup colorset
"    autocmd!
"    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
"    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
"  augroup END
"endif

