filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

syntax on
filetype plugin indent on

set foldmethod=indent
set foldlevel=99

set nocompatible
set backspace=indent,eol,start
set nobackup
set history=150
set showcmd
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set number
set encoding=utf-8
set list
set listchars=tab:>·,trail:·,extends:…,precedes:…,nbsp:&

set t_Co=256
colorscheme ir_black

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

set ruler

map Q gq

inoremap <C-U> <C-G>u<C-U>

set hlsearch

source ~/dot_files/.pep8

map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :set listchars=<CR>

nnoremap <silent> <up> g<up>
nnoremap <silent> <down> g<down>

" LaTeX
au Filetype tex set spell
au Filetype tex set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ '
au Filetype tex set errorformat=%f:%l:\ %m

" Force myself to use hjkl rather than arrow keys
nnoremap <expr> <Up> ((bufname("%") is "[Command Line]")?("\<Up>"):(""))
nnoremap <expr> <Down> ((bufname("%") is "[Command Line]")?("\<Down>"):(""))
nnoremap <expr> <Left> ((bufname("%") is "[Command Line]")?("\<Left>"):(""))
nnoremap <expr> <Right> ((bufname("%") is "[Command Line]")?("\<Right>"):(""))
inoremap <expr> <Up> ((bufname("%") is "[Command Line]")?("\<Up>"):(""))
inoremap <expr> <Down> ((bufname("%") is "[Command Line]")?("\<Down>"):(""))
inoremap <expr> <Left> ((bufname("%") is "[Command Line]")?("\<Left>"):(""))
inoremap <expr> <Right> ((bufname("%") is "[Command Line]")?("\<Right>"):(""))

command! W w
command! Q q
command! Wq wq
command! WQ wq

highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.* match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.* match BadWhitespace /\s\+$/

au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" set backspace = 2
