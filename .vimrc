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


map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
