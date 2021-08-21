" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" Exit insert mode in files and the terminal
inoremap jk <C-\><C-n>
tnoremap jk <C-\><C-n>

" }}}

" Basic options {{{

set hidden
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set title                       " set the terminal title to the current file
set virtualedit=all             " to edit where there is no actual character
set scrolloff=7                 " buffer when scrolling
set conceallevel=2
set concealcursor=
set number                      " line numbers
set relativenumber
let g:terminal_scrollback_buffer_size=100000

" }}}

" Searching {{{

set showmatch                   " show pairs match
set ignorecase                  " ignore case letters
set smartcase                   " smart case ignore

" }}}


" Backups {{{

" Enable persistent undo so that undo history persists across vim sessions
set undofile

set backup
set noswapfile
set backupdir=$HOME/.config/nvim/tmp/backup/
set undodir=$HOME/.config/nvim/tmp/undo
set directory=$HOME/.config/nvim/tmp/swap/
set viminfo+=n$HOME/.config/nvim/tmp/viminfo

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" make these dirs if they do not already exist
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Exiting without save
nnoremap <Leader>`` :qa!<CR>

" Make Y similar to D & C
nnoremap Y y$

" Quick saving
nmap <silent> <Leader>w :update<CR>

" Avoid a bug https://github.com/neovim/neovim/issues/12432
set display=lastline

" Open a cheat sheet (overriding Vim help)
" Append to the cheatsheat by editing ~/nvim/cheat40.txt
nmap <F1> :<c-u>Cheat40<cr>
let g:cheat40_use_default = 0

" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}
