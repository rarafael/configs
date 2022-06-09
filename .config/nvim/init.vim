autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

let mapleader = " "
nnoremap <Space> <Nop>

set mouse=a
set autoindent
set confirm
set cul
set history=150
set number relativenumber
set path+=**
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set softtabstop=4
set splitbelow splitright
set title
set wildmenu

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'bfrg/vim-cpp-modern'
Plug 'morhetz/gruvbox'
Plug 'vifm/vifm.vim'
Plug 'ap/vim-css-color'
call plug#end()

syntax enable
filetype plugin indent on

autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null"
autocmd BufEnter *.fasm silent! execute "set ft=fasm"
autocmd BufEnter README silent! execute "set ft=markdown"

nnoremap j gj
nnoremap k gk
nnoremap <S-y> y$
nnoremap ; :
nnoremap : ;
nnoremap <S-k> {
nnoremap <S-j> }
inoremap jk <Esc>
inoremap <C-o> <Esc>o
inoremap <C-a> <Esc>A
inoremap <C-y> <Esc>I
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-d><C-d> <Esc>ddi
inoremap <C-u> <Esc>u
inoremap <C-y> <Esc>yyp
vnoremap <S-k> {
vnoremap <S-j> }
vnoremap ; :
vnoremap : ;
nnoremap ! :!
