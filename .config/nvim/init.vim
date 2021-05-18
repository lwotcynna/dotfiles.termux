"" better not to change the order
source $HOME/.config/nvim/settings/plugins.vim

"" uncomment your desired colorscheme
"colorscheme {
  "source $HOME/.config/nvim/themes/onedark.vim
  source $HOME/.config/nvim/themes/gruvbox.vim
  "source $HOME/.config/nvim/themes/ayu.vim
  "source $HOME/.config/nvim/themes/owl4ce.vim
"}

source $HOME/.config/nvim/settings/coc.vim
source $HOME/.config/nvim/settings/indentline.vim
source $HOME/.config/nvim/settings/maps.vim
source $HOME/.config/nvim/settings/sets.vim

" statusline
source $HOME/.config/nvim/statusline/lightline.vim
"source $HOME/.config/nvim/statusline/airline.vim

"" python environment
let g:python3_host_prog = '/data/data/com.termux/files/usr/bin/python3.9'
let g:python_host_prog = '/data/data/com.termux/files/usr/bin/python2'
