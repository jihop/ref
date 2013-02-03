" Basic
set nocompatible
set noexrc
syntax on

set iskeyword+=_,$,@,%,#
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Tabs and Spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Indentation
set autoindent
set smartindent

" UI
set ruler
set number

" Highlight trailing empty spaces
fu! StartBleeding()
    syn match EvilSpace " \+$" containedin=ALL
    hi link EvilSpace Error
    syn match EvilSpace2 "\t" containedin=ALL
    hi link EvilSpace2 Error
endf

au BufNewFile,BufRead * silent call StartBleeding()
