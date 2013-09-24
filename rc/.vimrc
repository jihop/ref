" .vimrc
" Author: Jiho Park <jihop@jihopark.com>
" Source: https://raw.github.com/jihop/ref/master/rc/.vimrc

syntax on
set ruler
set number
set encoding=utf-8
set nocompatible
set nowrap
set noexrc
set showmode
set visualbell
set title
set modelines=0
set history=1000
set noswapfile        " no swap file
set background=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab         " no tabs (insert spaces instead)
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault
set autoindent
set smartindent
set iskeyword+=_,$,@,%,#
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Folding
set foldlevelstart=99     " no folds when starting
set foldmethod=indent

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Enable emacs ctrl+a ctrl+e in insert & command mode
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" Resize split screens on window resize
au VimResized * :wincmd =

" Returns to the same line when you reopen a file
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Highlight trailing empty spaces and tabs
fu! StartBleeding()
    syn match EvilSpace " \+$" containedin=ALL
    hi link EvilSpace Error
    syn match EvilSpace2 "\t" containedin=ALL
    hi link EvilSpace2 Error
endf
au BufNewFile,BufRead * silent call StartBleeding()
