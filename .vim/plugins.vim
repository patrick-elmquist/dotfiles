if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    Plug 'machakann/vim-highlightedyank'    " Show quickly flash the yanked content
    Plug 'unblevable/quick-scope'           " Show navigation hints for f/F/t/T
    Plug 'franbach/miramare'                " Color scheme
    Plug 'itchyny/lightline.vim'            " Show an improved status bar
    Plug 'udalov/kotlin-vim'                " Add Kotlin syntax highlighting
call plug#end()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

set termguicolors
let g:miramare_disable_italic_comment = 0
let g:miramare_transparent_background = 1

set background=dark
colorscheme miramare

" Used to hide the background when applying themes
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
