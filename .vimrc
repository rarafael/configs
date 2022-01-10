source $VIMRUNTIME/defaults.vim
let mapleader = " "
nnoremap <Space> <Nop>

" ########
" Options:
" ########

set autoindent
set autoindent
set autoread
set confirm
set history=150
set number relativenumber
set path+=**
set ruler
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smarttab
set softtabstop=4
set title
set viminfo='10,<100,:100,%,n~/.cache/vim/.viminfo
set wildmenu

" ########
" Plugins:
" ########

syntax enable
filetype plugin indent on

" ##########
" Functions:
" ##########

" Comment Line
function CommentLine()
   normal! mc0i#
   normal! `c
endfunction
nnoremap <Leader>cm :call CommentLine()<cr>

" Trailing Whitespace
highlight TrailingWhitespace ctermbg=red
match TrailingWhitespace /\s\+$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd BufRead,BufNew * match TrailingWhitespace /\s\+$/
" More aggresive highlightining approach " call matchadd('TrailingWhitespace', '\s\+$', 100)
nnoremap <Leader>wt :%s/\s\+$//g<cr>

" #######
" Remaps:
" #######

nnoremap <C-j> /<++><cr>ca<
nnoremap Y y$
nnoremap ; :
nnoremap : ;
