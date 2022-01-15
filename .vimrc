source $VIMRUNTIME/defaults.vim

" Change leader to <Space>
let mapleader = " "
nnoremap <SPACE> <Nop>

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
set splitbelow splitright
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
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
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
" More aggresive highlightining approach:
" call matchadd('TrailingWhitespace', '\s\+$', 100)
nnoremap <Leader>wt :%s/\s\+$//g<cr>

" #######
" Remaps:
" #######

" Leader keybinds
nnoremap <Leader>gg :Git<cr>
nnoremap <Leader>gd :Git diff<cr>
nnoremap <Leader>gc :Git commit<cr>
nnoremap <Leader>f :Goyo<cr>
nnoremap <Leader>j /<++><cr>ca<

" Keybinds for the clipboard
nnoremap <Leader>cp :read !echo "$(wl-paste -p)"<cr>
nnoremap <Leader>cc V::w !wl-copy -p<cr><cr>
vnoremap P c<Esc>k:read !echo "$(wl-paste -p)"<cr>
vnoremap Y ::w !wl-copy -p<cr><cr>

" Other
nnoremap Y y$
nnoremap ; :
nnoremap : ;
nnoremap <C-e> :tabedit<Space>
nnoremap <C-n> :tabnext<cr>
nnoremap <C-p> :tabprev<cr>
