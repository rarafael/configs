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
set autoindent
set smarttab
set softtabstop=4
set ruler
set path+=**
set wildmenu
set showcmd
set showmatch

" ########
" Plugins:
" ########
syntax enable
filetype plugin indent on

" ##########
" Functions:
" ##########
function CommentLine()
    normal! ^i#
endfunction

" #######
" Remaps:
" #######
nnoremap S :%s//g<Left><Left>
nnoremap <C-c> :call CommentLine()<cr>
nnoremap <C-j> /<++><cr>ci<
nnoremap ; :
nnoremap : ;