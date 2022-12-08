" ------------------
" Options
" ------------------
" set nocompatible                " get rid of Vi compatibility mode. SET FIRST!
                                " According to https://www.reddit.com/r/vim/wiki/vimrctips,
                                " it's not needed
set backspace=indent,eol,start  " make the backspace button work between lines

" ------------------
" UI
" ------------------
set termguicolors
set number relativenumber       " show realtive numbers, except for the current line
set scrolloff=5                 " always try to keep 5 lines of context when scrolling
set nowrap                      " don't wrap text
set ruler                       " show row/column in the status bar
set laststatus=2                " always show the statusline
set showmatch                   " briefly show the matching bracket
set matchtime=4                 " set the matching bracket time
set noshowmode                  " show which mode you are currently in
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
set autoindent
set copyindent
set nosmartindent

filetype plugin indent on       " filetype detection[ON] plugin[ON] indent[ON]
set tabstop=8                   " tab spacing
set softtabstop=4               " unify
set shiftround                  " always indent/outdent to the nearest tabstop
set shiftwidth=4                " indent/outdent by 4 columns
set expandtab                   " use spaces instead of tabs
set smarttab                    " use tabs at the start of a line, spaces elsewhere

set virtualedit=block

" keep persistent undo history across sessions, by storing in file
silent !mkdir ~/.vim/undo 2>/dev/null
set history=1000
set undodir=~/.vim/undo
set undofile
set undolevels=1000
set undoreload=10000
set nowritebackup

set wildmenu                    " used to toggle a menu for command line tab
set wildmode=list:longest,full  " tells the command line tab to complete to longest common

autocmd FileType zsh setlocal shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufEnter *.txt setlocal wrap linebreak
autocmd FileType c,cpp,java,kotlin autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd BufRead,BufNewFile   *.c,*.h set shiftwidth=4 tabstop=8 softtabstop=4

" ------------------
" Bindings
" ------------------
let mapleader = " "
nmap <Space> <Leader>

" Clear the search highlights
nnoremap <leader>c :noh<CR>
nnoremap <leader>zz :let &scrolloff=999-&scrolloff<CR>

" Make a search for trailing whitespaces
nnoremap <leader>w /\s\+$<CR>
nnoremap <leader><leader> :

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
nnoremap vv V
nnoremap V v$

" highlight last inserted text
nnoremap gV `[v`]

" send delete to black hole
noremap x "_x

" easy system clipboard copy/paste
noremap <space>y "+y
noremap <space>p "+p

" --------------------------------------------------
" Probation line, mappings below are being evaluated
" --------------------------------------------------

" Could be used to quickly paste from the yank register
inoremap ;0 <c-r>0
noremap <space>0 "0p

" In Docuement, used like vid or yid
xnoremap <silent> id :<c-u>normal! G$Vgg0<cr>
onoremap <silent> id :<c-u>normal! GVgg<cr>
