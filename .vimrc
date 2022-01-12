source $VIMRUNTIME/defaults.vim
let mapleader = " "
nnoremap <Space> <Nop>

" ########
" Options:
" ########

set autoindent
set autoread
set confirm
set history=150
set number relativenumber
set path+=**
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

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
call plug#end()

syntax enable
filetype plugin indent on

" ##########
" Functions:
" ##########

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

nnoremap <Leader><Space> /<++><cr>ca<
nnoremap Y y$
nnoremap ; :
nnoremap : ;
nnoremap <C-e> :tabedit<Space>
nnoremap <C-n> :tabnext<cr>
nnoremap <C-p> :tabprev<cr>
