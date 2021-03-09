" ------------------
" Options
" ------------------
set nocompatible                    " get rid of Vi compatibility mode. SET FIRST!
set backspace=indent,eol,start      " make the backspace button work between lines
set clipboard=unnamed,unnamedplus   " yank to the clipboard (might not work on windows)

" ------------------
" UI
" ------------------
set number relativenumber       " show realtive numbers, except for the current line
set cursorline                  " highlight the current line
set scrolloff=5                 " always try to keep 5 lines of context when scrolling
set nowrap                      " don't wrap text
set ruler                       " show row/column in the status bar
set laststatus=2                " always show the statusline
set showmatch                   " briefly show the matching bracket
set matchtime=4                 " set the matching bracket time
set showmode                    " show which mode you are currently in
set t_Co=256                    " enable 256-color mode.
set lazyredraw                  " boost performance in some cases
set splitright                  " open vsp to the right
set splitbelow                  " open sp below
syntax enable                   " enable syntax highlighting (previously syntax on).

" ------------------
" Searching
" ------------------
set hlsearch                    " highlight all matches after searching
set incsearch                   " highlight while searching
set ignorecase                  " make searches case-insensitive...
set smartcase                   " ...if the search is lower case only

" ------------------
" Tabs/Spaces
" ------------------
filetype plugin indent on       " filetype detection[ON] plugin[ON] indent[ON]
set tabstop=4                   " tab spacing
set softtabstop=4               " unify
set shiftwidth=4                " indent/outdent by 4 columns
set shiftround                  " always indent/outdent to the nearest tabstop
set expandtab                   " use spaces instead of tabs
set smarttab                    " use tabs at the start of a line, spaces elsewhere

autocmd FileType zsh setlocal shiftwidth=2 tabstop=2 softtabstop=2

" ------------------
" Bindings
" ------------------
let mapleader = " "
nmap <Space> <Leader>

" Clear the search highlights
nnoremap <leader>c :noh<CR>

" Make a search for trailing whitespaces
nnoremap <leader>w /\s\+$<CR>

" Disable arrow keys in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Go to SOC instead of SOL
noremap 0 ^

" Make Redo easier
nnoremap U <C-r>

" Make Y behave like other capital commands
nnoremap Y y$

" Same as doing *Ncgn, works with dot
nnoremap c* *``cgn
nnoremap c# #``cgN

" Same as doing *Ndgn, works with dot
nnoremap d* *``dgn
nnoremap d# #``dgN

" Add empty line below/above
noremap go o<Esc>k
noremap gO O<Esc>j

" Select all the content on the line
nnoremap vv ^vg_

" highlight last inserted text
nnoremap gV `[v`]

" send delete to black hole
noremap x "_x

" easy system clipboard copy/paste
noremap <space>y "+y
noremap <space>Y "+Y
noremap <space>p "+p
noremap <space>P "+P

" --------------------------------------------------
" Probation line, mappings below are being evaluated
" --------------------------------------------------

" Are these actually needed? Why not use C-O/I
" Drop a return mark before jumping.
" Return with `j or 'j
" nnoremap gg mjgg
" nnoremap G mjG
