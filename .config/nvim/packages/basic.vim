" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" Exit insert mode in files and the terminal
inoremap jk <C-\><C-n>
tnoremap jk <C-\><C-n>

" }}}

" Basic options {{{

set nohidden
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

" Permanent undo levels {{{

set undofile

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.config/nvim/tmp/backup/
set undodir=$HOME/.config/nvim/tmp/undo/
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
