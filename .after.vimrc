" <Leader> is `
" <LocalLeader> is ,
" [menu] is `

" <Leader> & <LocalLeader> mapping
nnoremap , <NOP>
nnoremap <space> <NOP>
let mapleader='`'
let maplocalleader= ','

" menu prefix key (for all Unite menus)
nnoremap [menu] <Nop>
nmap <Leader> [menu]

" Colorscheme
syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
colorscheme solarized

" interactive mode > normal mode (can't put comments inline with this one or it jumps randomly after exiting normal mode).
inoremap jk <ESC>
