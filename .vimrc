source $VIMRUNTIME/defaults.vim
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark 

" Change leader to <Space>
let mapleader = " "
nnoremap <SPACE> <Nop>

" ########
" Options:
" ########

set autoindent
set autoread
set confirm
set cul
set history=150
set number relativenumber
set path+=**
set shiftwidth=4
set showcmd
set showmatch
set mouse=nvi
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

" RVasm syntax
syntax keyword rvasmInstructions
	    \ lui auipc jal jalr beq bne blt bge bltu bgeu lb lh lw lbu lhu
	    \ sb sh sw addi slti sltiu xori ori andi slli srai add sub sll
	    \ slt sltu xor srl sra or and fence ecall ebreak
syntax keyword rvasmRegister
	    \ zero ra sp gp tp t0 t1 t2 fp s0 s1 s2 s3 a0 a2 a3 a4 a5 a6 a7
	    \ s4 s5 s6 s7 s8 s9 s10 s11 t3 t4 t5 t6
	    \ ft0 ft1 ft2 ft3 ft4 ft5 ft6 ft7 ft8 ft9 ft10 ft11
	    \ fs0 fs1 fs2 fs3 fs4 fs5 fs6 fs7 fs8 fs9 fs10 fs11
	    \ fa0 fa1
syntax match rvasmNumber "<\d+>"
syntax match rvasmNumber "<0x([Pp]-?)?>"
syntax match rvasmNumber "<0b[01]+>"
syntax match rvasmNumber "<0o\o+>"

hi def link rvasmInstructions Operator
hi def link rvasmRegister Keyword

" #########
" Autocmds:
" #########

autocmd BufWritePost *.tex silent! execute "!pdflatex % >/dev/null"
autocmd BufEnter *.fasm silent! execute "set ft=fasm"
autocmd BufEnter README silent! execute "set ft=markdown"

autocmd BufNewFile,BufEnter *.rvasm silent! execute "set ft=rvasm"

" #######
" Remaps:
" #######

" Leader keybinds
nnoremap <Leader>gg :Git<cr>
nnoremap <Leader>f :Goyo<cr>
nnoremap <Leader>wt mp:%s/\s\+$//g<cr>'p
nnoremap <Leader>j /<++><cr>ca<
nnoremap <Leader>tt :term<cr>
nnoremap <Leader>tw :term make<cr>
nnoremap <Leader>n :tabnext<cr>
nnoremap <Leader>p :tabprev<cr>
nnoremap <Leader>e :tabedit 
nnoremap <Leader>tn :sp ~/.local/share/TODO.md<CR><C-w>L
nnoremap <Leader>tp :vertical term++close python<cr>
nnoremap <Leader>m :vertical term++close man 

" Keybinds for the clipboard
nnoremap <Leader>cp :read !echo "$(wl-paste --primary)"<cr>
nnoremap <Leader>cy V::w !wl-copy --primary<cr><cr>
vnoremap <S-p> c<Esc>k:read !echo "$(wl-paste --primary)"<cr>
vnoremap <S-y> ::w !wl-copy --primary<cr><cr>

" Other
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
