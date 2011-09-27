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

set t_Co=256
colorscheme ir_black

set ruler

filetype plugin indent on

map Q gq

inoremap <C-U> <C-G>u<C-U>

syntax on
set hlsearch

source /home/yano/dot_files/.pep8

map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

nnoremap <silent> <up> g<up>
nnoremap <silent> <down> g<down>

" LaTeX
au Filetype tex set spell
au Filetype tex set makeprg=pdflatex\ \-file\-line\-error\ \-interaction=nonstopmode\ $*\\\|\ grep\ \-P\ ':\\d{1,5}:\ '
au Filetype tex set errorformat=%f:%l:\ %m
