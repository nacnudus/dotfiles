if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Run vim-sensible first so it can be easily overridden.
runtime! plugin/sensible.vim

"------------------------------------------------------------------------------
" NeoBundle
"------------------------------------------------------------------------------
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Lokaltog/vim-easymotion'           " move by hotkey
NeoBundle 'SirVer/ultisnips'                  " snippets
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'benmills/vimux'                    " interact with tmux
NeoBundle 'bling/vim-airline'                 " status bar
NeoBundle 'chrisbra/csv.vim'                  " edit csv files
NeoBundle 'christoomey/vim-tmux-navigator'    " seamlessly move between vim and tmux panes with ctrl+hjkl
NeoBundle 'dahu/vim-fanfingtastic'            " use f and F across lines
NeoBundle 'davidhalter/jedi-vim'              " autocompletion for Python
NeoBundle 'gregsexton/gitv'                   " git repository browser
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle' " automagically toggle absolute/relative line numbers
NeoBundle 'kshenoy/vim-signature'             " visible marks
NeoBundle 'mattn/gist-vim'                    " interact with gists
NeoBundle 'mattn/webapi-vim'                  " necessary for gist-vim
NeoBundle 'mbbill/undotree'                   " undo tree
NeoBundle 'mhinz/vim-signify'                 " track diffs in the margin
" NeoBundle 'nelstrom/vim-markdown-folding'   " fold markdown (unnecessary with vim-pandoc?)
NeoBundle 'shougo/vimshell'                   " use the shell from within vim
NeoBundle 'terryma/vim-multiple-cursors'      " edit several places at once
NeoBundle 'tpope/vim-fugitive'                " git from vim
NeoBundle 'tpope/vim-repeat'                  " necessary for Tim Pope's other plugins
NeoBundle 'tpope/vim-sensible'                " sensible settings to start with
NeoBundle 'tpope/vim-surround'                " change surrounding thingies to other thingies
NeoBundle 'tpope/vim-unimpaired'              " pairs of handy bracket matchings
NeoBundle 'vim-pandoc/vim-pandoc'             " better than tpope and vim-flavoured-markdown?
"
" vim-scripts repos
NeoBundle 'Auto-Pairs'                        " Closing parenthesis etc.
NeoBundle 'Vim-R-plugin'

" gist repos

" Non github repos
NeoBundle 'git://github.com/godlygeek/tabular.git' " align text
NeoBundle 'git://git.code.sf.net/p/atp-vim/code', {'name': 'apt-vim'} " Automatic Latex Plugin

" Installation check.
NeoBundleCheck

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

"------------------------------------------------------------------------------
" NeoBundle ends here
"------------------------------------------------------------------------------

" Settings
colorscheme solarized
"set paste                         " Ordinary paste behaviour (causes problems with inoremap jj <ESC>)
set autoread                      " Reload files changed outside vim
set background=dark
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set foldcolumn=2
set foldenable
set foldminlines=2
set gcr=a:blinkon0                " Disable cursor blink
set hidden                        " Handle multiple buffers better
set ignorecase                    " Better searching
set lazyredraw                    " don't redraw when don't have to
set magic                         " Enable the magic
set nobackup                      " No backup when writing a file
set noerrorbells visualbell t_vb= " Disable ALL bells
set noswapfile                    " don't use swap files
set nowritebackup                 " No backup when writing a file
set number                        " line numbers
set showfulltag                   " show full completion tags
set smartcase                     " Better searching
set wrap                          " line wrapping

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
"
" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","
" Isolate easymotion to avoid conflicts
let g:EasyMotion_leader_key = '\'

" mappings
inoremap jj <ESC>
nnoremap <F5> :UndotreeToggle<CR>
nmap Y y$

" r-plugin mapping to clear the memory and the knitr cache
nmap <LocalLeader>kr :call SendCmdToR('rm(list=ls(all.names=TRUE)); unlink("cache/*")')<CR>

" map screen jumping
map <leader>h <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l

" Reindent File
map <silent> <LocalLeader>ri G=gg<CR>

" toggle wrapping
nmap <LocalLeader>ww :set wrap!<CR>
nmap <LocalLeader>wo :set wrap<CR>

" clear spaces at end of line
map <silent> <LocalLeader>Cs :%s/\s\+$//e<CR>
" open file from where last edited (GB screencast)
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Syntastic
nmap <LocalLeader>s :SyntasticCheck<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" NumberToggle trigger
let g:NumberToggleTrigger="<F3>"

" spelling
set spell spelllang=en

" use ag for searching
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

" LanguageTool path
let g:languagetool_jar=$HOME . '/LanguageTool-2.4.1/languagetool.jar'

" Use vim-pandoc for .md markdown files
au BufNewFile,BufRead *.md   set filetype=pandoc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sample settings for vim-r-plugin and screen.vim
" Installation 
"       - Place plugin file under ~/.vim/
"       - To activate help, type in vim :helptags ~/.vim/doc
"       - Place the following vim conf lines in .vimrc
" Usage
"       - Read intro/help in vim with :h vim-r-plugin or :h screen.txt
"       - To initialize vim/R session, start screen/tmux, open some *.R file in vim and then hit F2 key
"       - Object/omni completion command CTRL-X CTRL-O
"       - To update object list for omni completion, run :RUpdateObjList
" My favorite Vim/R window arrangement 
"	tmux attach
"	Open *.R file in Vim and hit F2 to open R
"	Go to R pane and create another pane with C-a %
"	Open second R session in new pane
"	Go to vim pane and open a new viewport with :split *.R
" Useful tmux commands
"       tmux new -s <myname>       start new session with a specific name
"	tmux ls (C-a-s)            list tmux session
"       tmux attach -t <id>        attach to specific session  
"       tmux kill-session -t <id>  kill specific session
" 	C-a-: kill-session         kill a session
" 	C-a %                      split pane vertically
"       C-a "                      split pane horizontally
" 	C-a-o                      jump cursor to next pane
"	C-a C-o                    swap panes
" 	C-a-: resize-pane -L 10    resizes pane by 10 to left (L R U D)
" Corresponding Vim commands
" 	:split or :vsplit      split viewport
" 	C-w-w                  jump cursor to next pane-
" 	C-w-r                  swap viewports
" 	C-w C-++               resize viewports to equal split
" 	C-w 10+                increase size of current pane by value

" To open R in terminal rather than RGui (only necessary on OS X)
" let vimrplugin_applescript = 0
" let vimrplugin_screenplugin = 0
" For tmux support
let g:ScreenImpl = 'Tmux'
let vimrplugin_vsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell' 
" instruct to use your own .screenrc file
" let g:vimrplugin_noscreenrc = 1 " deprecated
" For integration of r-plugin with screen.vim
" let g:vimrplugin_screenplugin = 1 " deprecated
" Don't use conque shell if installed
let vimrplugin_conqueplugin = 0
" map the letter 'r' to send visually selected lines to R 
let g:vimrplugin_map_r = 1
" see R documentation in a Vim buffer
let vimrplugin_vimpager = "no"
"set expandtab
set shiftwidth=4
set tabstop=8
" start R with F2 key
map <F2> <Plug>RStart 
imap <F2> <Plug>RStart
vmap <F2> <Plug>RStart
" send selection to R with space bar
vmap <Space> <Plug>RDSendSelection 
" send line to R with space bar
nmap <Space> <Plug>RDSendLine

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" Sort function from Gerald Lai at http://www.vim.org/tips/tip.php?tip_id=923 (use last
" script on page, not first!!!!!).
" paste in vimrc file - tested with GVim 6.3

"** use visual block <Ctrl-V> to select lines to sort and hit <F3> **
vmap <F3> :call Sort(Prompt("0","1"),Prompt("1","f"),"Strcmp")<CR>

"sort lines function
function Sort(wnum, order, cmp) range
  normal `<
  execute "let startcol = col(\".\")"
  normal `>
  execute "let endcol = col(\".\")"
  if startcol <= endcol
    let firstcol = startcol
    let lastcol = endcol
  else
    let firstcol = endcol
    let lastcol = startcol
  endif

  call SortR(a:firstline, a:lastline, firstcol, lastcol, a:wnum, a:order, a:cmp)
  normal gv
endfunction

"sort lines recursively
function SortR(start, end, first, last, wnum, order, cmp)
  if a:start >= a:end
    return
  endif

  let partition = a:start - 1
  let middle = partition
  let partstr2 = Words2(getline((a:start + a:end) / 2), a:first, a:last, a:wnum)
  let i = a:start

  while i <= a:end
    let str = getline(i)
    let partstr = Words2(str, a:first, a:last, a:wnum)
    if a:order == "r"
      execute "let result = ".a:cmp."(partstr2, partstr)"
    else
      execute "let result = ".a:cmp."(partstr, partstr2)"
    endif

    if result <= 0
      "swap i before partition
      let partition = partition + 1

      if result == 0
        let middle = partition
      endif

      if i != partition
        let str2 = getline(partition)
        call setline(i, str2)
        call setline(partition, str)
      endif
    endif

    let i = i + 1
  endwhile

  "make sure middle element at end of partition
  if middle != partition
    let str = getline(middle)
    let str2 = getline(partition)
    call setline(middle, str2)
    call setline(partition, str)
  endif

  call SortR(a:start, partition - 1, a:first, a:last, a:wnum, a:order, a:cmp)
  call SortR(partition + 1, a:end, a:first, a:last, a:wnum, a:order, a:cmp)
endfunction

"determine compare strings
function Words2(line, first, last, wnum)
  if a:wnum == "v"
    return strpart(a:line, a:first - 1, a:last - a:first + 1)
  elseif a:wnum > 1
    return strpart(a:line, matchend(a:line, "\\s*\\(\\S*\\s*\\)\\{".(a:wnum - 1)."}"))
  elseif a:wnum == 1
    return strpart(a:line, matchend(a:line, "\\s*"))
  elseif a:wnum < 0
    return matchstr(a:line, "\\(\\S*\\s*\\)\\{".(-a:wnum)."}$")
  else
    return a:line
  endif
endfunction

"compare two strings
function Strcmp(str1, str2)
  if a:str1 < a:str2
    return -1
  elseif a:str1 > a:str2
    return 1
  else
    return 0
  endif
endfunction

"prompt user for settings
function Prompt(str, ...)
  let default = a:0 ? a:1 : ""
  if a:str == "0"
    let str = "Sort by which word [(0)whole line (<0)count from right (v)isual]? "
  elseif a:str == "1"
    let str = "Order [(f)orward (r)everse]? "
  endif

  execute "let ret = input(\"".str."\", \"".default."\")"

  return ret
endfunction 

