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

" NeoBundle 'jmcantrell/vim-virtualenv' " use the correct python virtual environment
" NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'} " write HTML faster
NeoBundle 'benmills/vimux' " interact with tmux
NeoBundle 'bling/vim-airline' " status bar
NeoBundle 'chrisbra/csv.vim' " edit csv files
NeoBundle 'ervandew/supertab' " tab completion
NeoBundle 'git://github.com/godlygeek/tabular.git' " align text
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle' " automagically toggle absolute/relative line numbers
NeoBundle 'Lokaltog/vim-easymotion' " move by hotkey
NeoBundle 'mattn/webapi-vim' " necessary for gist-vim
NeoBundle 'mattn/gist-vim' " interact with gists
NeoBundle 'maxbrunsfeld/vim-yankstack' " better yanking
NeoBundle 'mhinz/vim-signify' " track diffs in the margin
NeoBundle 'scrooloose/syntastic' " syntax checking
NeoBundle 'Shougo/unite.vim' " browse directories and goodness knows what
NeoBundle 'SirVer/ultisnips' " snippets
NeoBundle 'sjl/gundo.vim' " undo tree
NeoBundle 'terryma/vim-multiple-cursors' " edit several places at once
NeoBundle 'tomtom/tcomment_vim' " commenting
NeoBundle 'tpope/vim-abolish' " search and replace word roots
NeoBundle 'tpope/vim-endwise' " automagically add 'endif' after 'if' etc.
NeoBundle 'tpope/vim-eunuch' " vim sugar for UNIX commands
NeoBundle 'tpope/vim-fugitive' " git from vim
NeoBundle 'tpope/vim-markdown' " Tim Pope's markdown - others available
NeoBundle 'tpope/vim-repeat' " necessary for Tim Pope's other plugins
NeoBundle 'tpope/vim-sensible' " sensible settings to start with
NeoBundle 'tpope/vim-sleuth' " automagically indent
NeoBundle 'tpope/vim-speeddating' " increment dates?
NeoBundle 'tpope/vim-surround' " change surrounding thingies to other thingies
NeoBundle 'tpope/vim-unimpaired' " pairs of handy bracket matchings

" vim-scripts repos
NeoBundle 'Auto-Pairs'
" NeoBundle 'Screen-vim---gnu-screenmux'
" NeoBundle 'Vim-R-plugin'

" gist repos
" NeoBundle 'gist:Shougo/656148', {
"       \ 'name': 'everything.vim',
"       \ 'script_type': 'plugin'}
 
" Non git repos
" NeoBundle 'git://github.com/godlygeek/tabular.git'

" syntax mappings
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jQuery'
NeoBundle 'othree/html5-syntax.vim'

" more complicated installations
NeoBundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" NeoBundle 'Shougo/vimproc', {
     " " \ 'build' : {
     " \     'windows' : 'make -f make_mingw32.mak',
     " \     'cygwin' : 'make -f make_cygwin.mak',
     " \     'mac' : 'make -f make_mac.mak',
     " \     'unix' : 'make -f make_unix.mak',
     " \    },
     " \ }

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

" Call yankstap early and set mappings afterwards.
call yankstack#setup()

" mappings
let mapleader = ","
inoremap jj <ESC>
nnoremap <F5> :GundoToggle<CR>
nmap Y y$

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk



" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" spelling
set spell spelllang=en_nz
