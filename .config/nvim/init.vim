" Gruvbox theme configuration
autocmd vimenter * ++nested colorscheme srcery
set background=dark

" Mapping leaderkey
let mapleader = " "
nnoremap <Space> <Nop>

" ############
" # OPTIONS: #
" ############

set autoindent
set confirm
set cul
set complete=i
set history=150
set hlsearch
set incsearch
set mouse=a
set nomodified
set number relativenumber
set path+=**
set shiftwidth=4
set shortmess+=a
set showcmd
set smartcase
set smarttab
set softtabstop=4
set splitbelow splitright
set title
set wildmenu
set inccommand=split
set clipboard+=unnamedplus
set expandtab

" ############
" # PLUGINS: #
" ############

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'bfrg/vim-cpp-modern'
Plug 'morhetz/gruvbox'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'srcery-colors/srcery-vim'
call plug#end()

syntax on
filetype plugin indent on

" #################
" # AUTOCOMMANDS: #
" #################

" Auto refresh texfiles
autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null"
" FASM syntax
autocmd BufEnter *.fasm silent! execute "set ft=fasm"
" Turn READMEs into markdown
autocmd BufEnter README silent! execute "set ft=markdown"
" Disable numbered lines in terminal windows
autocmd TermOpen * setlocal nonumber norelativenumber bh=wipe
" Enable syntax highlightning for terminal man-pages
autocmd TermOpen *:man* silent! execute "set ft=man"

" #Torkoal, autocommand group to disable hlsearch once you leave cmdline
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" #############
" # KEYBINDS: #
" #############

" Leader binds for tabs
nnoremap <Leader>e :tabnew 
nnoremap <Leader>. :tabnext<CR>
nnoremap <Leader>, :tabprevious<CR>

" Leader binds to open terminal windows
nnoremap <Leader>tw :split term://make<CR>
nnoremap <Leader>tb :split term://./build.sh<CR>
nnoremap <Leader>tt :split term://zsh<CR>i
nnoremap <Leader>m :vertical :Man 

" Leader keybind for FZF
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fg :Rg<CR>

" ! for faster command execution
nnoremap ! :!

" Map Control+C to ESC
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>
inoremap <C-c> <Esc>

" Better scrolling
nnoremap j gj
nnoremap k gk

" Switches ':' with ';' for faster commands
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Shift+k or j walks through paragraphs
nnoremap <S-k> {
nnoremap <S-j> }
vnoremap <S-k> {
vnoremap <S-j> }

" Easy of use insert mode binds
inoremap <C-o> <Esc>o
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-y> <Esc>yyp
