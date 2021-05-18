" Get default from :h lightline
let g:lightline.active = {
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'filetype' ] ]
    \ }

let g:lightline.inactive = {
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'filetype' ] ]
    \ }

let g:lightline.tab = {
    \ 'active': [ 'filename', 'ficolorsme', 'modified' ],
    \ 'inactive': [ 'filename', 'ficolorsme', 'modified' ] }

let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 1
    \ }

let g:lightline.separator = {
    \   'left': '▏', 'right': ''
    \}
let g:lightline.subseparator = {
    \   'left': '▏', 'right': ''
    \}

let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

"let g:lightline.tabline = {
"    \ 'left': [ [ 'tabs' ] ],
"    \ 'right': [ ] }
