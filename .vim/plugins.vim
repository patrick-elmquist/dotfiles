if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'machakann/vim-highlightedyank'
    Plug 'unblevable/quick-scope'
    Plug 'franbach/miramare'
call plug#end()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

set termguicolors
let g:miramare_disable_italic_comment = 0
let g:miramare_transparent_background = 1
colorscheme miramare
