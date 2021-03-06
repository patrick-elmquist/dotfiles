if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    " Below plugins also exist in IDEAVim rc file
    Plug 'machakann/vim-highlightedyank'    " Quickly flash the yanked content
    Plug 'tpope/vim-commentary'             " Adds gcc to comment a line

    Plug 'unblevable/quick-scope'           " Show navigation hints for f/F/t/T

    " Plug 'rakr/vim-two-firewatch'
    Plug 'embark-theme/vim', { 'as': 'embark' }

    Plug 'sheerun/vim-polyglot'             " Improved syntax highlighting

    Plug 'romainl/vim-cool'                 " Disable hlsearch when done
    Plug 'itchyny/lightline.vim'            " Show an improved status bar
    Plug 'udalov/kotlin-vim'                " Add Kotlin syntax highlighting
    Plug 'andymass/vim-matchup'
call plug#end()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

set termguicolors

" set background=dark
" let g:two_firewatch_italics=1
" colo two-firewatch

colorscheme embark
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }
" let g:lightline = {
"       \ 'colorscheme': 'twofirewatch',
"       \ }
