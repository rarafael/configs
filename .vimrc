source $VIMRUNTIME/defaults.vim

" ########
" Options:
" ########
set history=150
set number relativenumber
set title
set smartcase
set autoread
set confirm
set autoindent
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set ruler
set path+=**
set nocompatible
set wildmenu
set showcmd
set showmatch

" ########
" Plugins:
" ########
syntax enable
filetype plugin on

" #######
" Remaps:
" #######
nnoremap S :%s//g<Left><Left>
nnoremap <C-c> ^i#<Esc>j
nnoremap ; :
nnoremap : ;
