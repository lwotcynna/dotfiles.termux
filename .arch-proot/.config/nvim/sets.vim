" general sets
set encoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8
syntax enable

set noswapfile
set wrap

" Make tilde of the end of buffer disappeared
set fillchars=eob:\ 

" Highlight the line on which the cursor lives.
"set cursorline

" cursor type underlined
set guicursor=n-v-c-sm:hor20,i-ci-ve:ver25,r-cr-o:hor20

" Always show at least three lines above/below the cursor.
set scrolloff=3
" Always show at least three line left/right of the cursor.
set sidescrolloff=7

" line numbers
set rnu nu

" currently nvim has this ability
set signcolumn=yes

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=trail:•,extends:#,nbsp:.
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Use termux system clipboard
set clipboard=unnamedplus

" Remove timeout for partially typed commands
set notimeout

" Indentation and friends
set smarttab
set autoindent
set backspace=indent,eol,start
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

filetype plugin indent on

" Tab handling for python
autocmd filetype python,lua setlocal tabstop=4 softtabstop=4 shiftwidth=4

" disable autocomment
autocmd filetype * setlocal formatoptions-=cro

" Allow switching between buffers without saving
set hidden

" Mouse support
set mouse=a

"Case insensitive searching
set ignorecase

"Will automatically switch to case sensitive if you use any capitals
set smartcase

" Auto toggle smart case of for ex commands
" Assumes 'set ignorecase smartcase'
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

" Substitute live preview
set inccommand=nosplit

" Markdown Folding
let g:markdown_fold_style = 'nested'

" If statusline is enabled, don't show mode under it
set noshowmode

" uncomment below line according to your current shell
set shell=/usr/bin/zsh
"set shell=/data/data/com.termux/files/usr/bin/zsh

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

set wildmenu

" Restore last cursor position and marks on open
au BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' 
  \ |   exe "normal! g`\""
  \ | endif

autocmd StdinReadPre * let s:std_in=1

"hi Directory guifg=#FF0000 ctermfg=white
