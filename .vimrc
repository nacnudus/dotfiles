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

" NeoBundle 'jmcantrell/vim-virtualenv'         " use the correct python virtual environment
" NeoBundle 'jtratner/vim-flavored-markdown'    " add-on to T Pope's that recognises code blocks
" NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'} " write HTML faster
" NeoBundle 'tpope/vim-markdown'                " Tim Pope's markdown - others available
NeoBundle 'benmills/vimux'                    " interact with tmux
NeoBundle 'bling/vim-airline'                 " status bar
NeoBundle 'chrisbra/csv.vim'                  " edit csv files
NeoBundle 'chrisbra/NrrwRgn'                  " move a region to scratch for safe global editing
NeoBundle 'christoomey/vim-tmux-navigator'    " seamlessly move between vim and tmux panes with ctrl+hjkl
NeoBundle 'dahu/vim-fanfingtastic'            " use f and F across lines
NeoBundle 'ervandew/screen'                   " for Vim-R-plugin
NeoBundle 'ervandew/supertab'                 " tab completion
NeoBundle 'gregsexton/gitv'                   " git repository browser
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle' " automagically toggle absolute/relative line numbers
NeoBundle 'kshenoy/vim-signature'             " visible marks
NeoBundle 'klen/python-mode'                  " everything Python
NeoBundle 'Lokaltog/vim-easymotion'           " move by hotkey
NeoBundle 'mattn/gist-vim'                    " interact with gists
NeoBundle 'mattn/webapi-vim'                  " necessary for gist-vim
NeoBundle 'maxbrunsfeld/vim-yankstack'        " better yanking
NeoBundle 'mbbill/undotree'                   " undo tree
NeoBundle 'mhinz/vim-signify'                 " track diffs in the margin
NeoBundle 'scrooloose/syntastic'              " syntax checking
NeoBundle 'Shougo/neocomplete.vim'            " auto completion requires lua
NeoBundle 'Shougo/unite.vim'                  " browse directories and goodness knows what
NeoBundle 'shougo/vimshell'                   " use the shell from within vim
NeoBundle 'SirVer/ultisnips'                  " snippets
NeoBundle 'terryma/vim-expand-region'         " extend/shrink visual selection with +_
NeoBundle 'terryma/vim-multiple-cursors'      " edit several places at once
NeoBundle 'tomtom/tcomment_vim'               " commenting
NeoBundle 'tpope/vim-abolish'                 " search and replace word roots
NeoBundle 'tpope/vim-characterize'            " identify character under cursor with ga
NeoBundle 'tpope/vim-endwise'                 " automagically add 'endif' after 'if' etc.
NeoBundle 'tpope/vim-eunuch'                  " vim sugar for UNIX commands
NeoBundle 'tpope/vim-fugitive'                " git from vim
NeoBundle 'tpope/vim-repeat'                  " necessary for Tim Pope's other plugins
NeoBundle 'tpope/vim-sensible'                " sensible settings to start with
NeoBundle 'tpope/vim-sleuth'                  " automagically indent
NeoBundle 'tpope/vim-speeddating'             " increment dates?
NeoBundle 'tpope/vim-surround'                " change surrounding thingies to other thingies
NeoBundle 'tpope/vim-unimpaired'              " pairs of handy bracket matchings
NeoBundle 'vim-pandoc/vim-pandoc'             " better than tpope and vim-flavoured-markdown?
NeoBundle 'nelstrom/vim-markdown-folding'     " fold markdown
NeoBundle 'zhaocai/GoldenView.Vim'            " Always have a nice view for vim split windows

" vim-scripts repos
NeoBundle 'Auto-Pairs'                        " Closing parenthesis etc.
NeoBundle 'LanguageTool'
NeoBundle 'Vim-R-plugin'
" NeoBundle 'screen.vim'                      " Already got from ervandew?

" gist repos
" NeoBundle 'gist:Shougo/656148', {
"       \ 'name': 'everything.vim',
"       \ 'script_type': 'plugin'}

" Non github repos
NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'git://github.com/godlygeek/tabular.git' " align text

" syntax mappings
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jQuery'
NeoBundle 'othree/html5-syntax.vim'

" more complicated installations
NeoBundle 'altercation/vim-colors-solarized'
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
colorscheme solarized
set background=dark

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

NeoBundle 'majutsushi/tagbar' " class outline viewer
nmap <F8> :TagbarToggle<CR>
" ctags markdown
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
       	 \ 'h:Heading_L1',
       	 \ 'i:Heading_L2',
       	 \ 'k:Heading_L3'
        \ ]
\ }

" ctags R
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }" ...

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
set hidden                        " Handle multiple buffers better
set ignorecase                    " Better searching
set smartcase                     " Better searching
set wrap                          " line wrapping
set noswapfile                    " don't use swap files
set nobackup                      " No backup when writing a file
set nowritebackup                 " No backup when writing a file
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set gcr=a:blinkon0                " Disable cursor blink
set autoread                      " Reload files changed outside vim
set lazyredraw                    " don't redraw when don't have to
set magic                         " Enable the magic
set noerrorbells visualbell t_vb= " Disable ALL bells
set showfulltag                   " show full completion tags
set foldenable
set foldcolumn=2
set foldminlines=2
set number                        " line numbers
" set paste                         " ordinary paste behaviour?  Causes
" problems

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Call yankstap early and set mappings afterwards.
call yankstack#setup()

" Map leader and localleader key to comma
let mapleader = ","
let g:mapleader = ","
let maplocalleader = ","
let g:maplocalleader = ","

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
set spell spelllang=en_nz

" vim-flavoured-markdown by default
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" use ag for searching
if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
endif

" Unite configuration
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite ag:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
nnoremap <space>s :Unite -quick-match buffer<cr>

" Toggle goldenview so it doesn't interfere with, e.g., gitv
nmap <F4> <Plug>ToggleGoldenViewAutoResize

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
let vimrplugin_screenvsplit = 1 " For vertical tmux split
let g:ScreenShellInitialFocus = 'shell' 
" instruct to use your own .screenrc file
let g:vimrplugin_noscreenrc = 1
" For integration of r-plugin with screen.vim
let g:vimrplugin_screenplugin = 1
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


" set folding scheme; more on this see: 
" http://www.dgp.toronto.edu/~mjmcguff/learn/vim/folding.txt
" http://vim.dindinx.net/orig/usr_28.txt
"set foldcolumn=0 " if set to > 1 together with 'set number', then the copy&paste of screen will include the line numbers
"highlight Folded ctermfg=yellow ctermbg=blue  	
" highlight  works only when colorscheme is uncommented
"set foldmethod=indent
"hi FoldColumn ctermbg=NONE

" For Latex work: open *.pdf files in evince/xpdf upon opening of *.tex files in vim 
" more on this on this page: http://ubuntuforums.org/showthread.php?p=5351607
au BufRead *.tex silent !xpdf %<.pdf 2>/dev/null &
au BufRead *.Rnw silent !xpdf %<.pdf 2>/dev/null &

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

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

" ------------------------------
" neocomplete
" ------------------------------
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
" SQL
let g:neocomplete#sources#omni#functions.sql =
  \ 'sqlcomplete#Complete'
" R (plugin: vim-R-plugin)
let g:neocomplete#sources#omni#input_patterns.r =
  \ '[[:alnum:].\\]\+'
let g:neocomplete#sources#omni#functions.r =
  \ 'rcomplete#CompleteR'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'







" ------------------------------
