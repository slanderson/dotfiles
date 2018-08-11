" run vundle setup
source ~/.vim/vundle_vimrc

" let vim enable useful features that aren't compatible with vi
set nocompatible

" allow buffers with unwritten changes to be hidden
set hidden

" set better search behavior
set hlsearch 
set incsearch

" do more intuitive backspacing
set backspace=indent,eol,start

" turn on syntax highlighting
syntax enable
set background=light
colorscheme solarized

" bring up a completion menu when Tab-completion is used
set wildmenu

" Set the Space bar as the leader key
let mapleader = "\<Space>"

" turn on relative line numbers
set number
set relativenumber

" 'gb' in normal mode will bring up buffer list and pre-type the 'b'
nnoremap gb :ls<CR>:b<Space>

" require fewer keystrokes to switch windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" configure spaces-to-tabs
set expandtab tabstop=4 shiftwidth=4 autoindent smartindent softtabstop=4
set textwidth=90

" Search for a file in all subdirectories quickly
set path=.,**
nnoremap <leader>f :find *

