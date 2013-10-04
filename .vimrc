 if has('vim_starting')
   set nocompatible               " Be iMproved
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 NeoBundleFetch 'Shougo/neobundle.vim'

 " Recommended to install
 " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile

 " My Bundles here:

 " Note: You don't set neobundle setting in .gvimrc!

 " Original repos on github
 NeoBundle 'ervandew/supertab'
 NeoBundle 'Lokaltog/vim-easymotion'
 " webapi-vim is necessary for gist-vim
 NeoBundle 'mattn/webapi-vim'
 NeoBundle 'Raimondi/delimitMate'
 NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'sjl/gundo.vim'
 NeoBundle 'tpope/vim-abolish'
 NeoBundle 'tpope/vim-commentary'
 NeoBundle 'tpope/vim-endwise'
 NeoBundle 'tpope/vim-fugitive'
 NeoBundle 'tpope/vim-markdown'
 NeoBundle 'tpope/vim-repeat'
 NeoBundle 'tpope/vim-sensible'
 NeoBundle 'tpope/vim-sleuth'
 NeoBundle 'tpope/vim-speeddating'
 NeoBundle 'tpope/vim-surround'
 NeoBundle 'tpope/vim-unimpaired'
 NeoBundle 'tsaleh/vim-matchit'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'SirVer/ultisnips'

 " vim-scripts repos
 " NeoBundle 'Screen-vim---gnu-screenmux'
 " NeoBundle 'Vim-R-plugin'

 " gist repos
 " NeoBundle 'gist:Shougo/656148', {
 "       \ 'name': 'everything.vim',
 "       \ 'script_type': 'plugin'}
  
 " Non git repos
 NeoBundle 'git://git.wincent.com/command-t.git'
 NeoBundle 'git://github.com/godlygeek/tabular.git'

 " syntax mappings
 NeoBundle 'hail2u/vim-css3-syntax'
 NeoBundle 'jelera/vim-javascript-syntax'
 NeoBundle 'jQuery'
 NeoBundle 'othree/html5-syntax.vim'

 " more complicated installations
 NeoBundle 'altercation/vim-colors-solarized'
 if has('gui_running')
    set background=light
 else
    set background=dark
 endif

 NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

 NeoBundle 'majutsushi/tagbar'
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
 " NeoBundles end here

 filetype plugin indent on     " Required!
 "
 " Brief help
 " :NeoBundleList          - list configured bundles
 " :NeoBundleInstall(!)    - install(update) bundles
 " :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

 " Installation check.
 NeoBundleCheck

 " mappings
 let maplocalleader = ","
 nnoremap <F5> :GundoToggle<CR>

