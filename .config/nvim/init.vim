" This is the main config directory
let $NACVIM="/home/nacnudus/.config/nvim"

language en_GB.UTF-8

" vim-plug auto-installation and setup {{{

" auto install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" }}}

" PLUGINS (administrated by vim-plug) {{{

" Required:
call plug#begin(expand($NACVIM.'/plugged'))

" My plugins here: (all have to appear in the same vimrc, it seems)

" Language Server
Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe' " completion

" Syntax (treesitter)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground' " Reveal the abstract syntax tree
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'p00f/nvim-ts-rainbow' " rainbow parentheses
Plug 'romgrk/nvim-treesitter-context' " when the context scrolls out of view

" Debug
" Plug 'mfussenegger/nvim-dap' " No support for R or Julia, Python looks hard
" Plug 'theHamsta/nvim-dap-virtual-text'

" Git
Plug 'tpope/vim-fugitive' " Git integration
Plug 'tpope/vim-rhubarb' " Github integration via fugitive
Plug 'jreybert/vimagit' " better than fugitive for committing
Plug 'airblade/vim-gitgutter' " symbol margin for fugitive and vimagit
" TODO: replace gitgutter with https://github.com/lewis6991/gitsigns.nvim when
" mature

" Send code to a REPL
Plug 'jalvesaq/vimcmdline'

" R
Plug 'jalvesaq/Nvim-R', { 'for': ['r', 'rhelp', 'rmd', 'rrst',
      \ 'rbrowser', 'rdoc', 'rout', 'rmarkdown', 'rnoweb'] }

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Python
Plug 'python-mode/python-mode', { 'for': ['python'] }
Plug 'psf/black', { 'branch': 'stable' } " https://github.com/psf/black/issues/1767

" LaTeX
Plug 'lervag/vimtex', { 'for': ['tex',  'bib', 'bst'] }

" Lilypond
Plug 'gisraptor/vim-lilypond-integrator', { 'for': 'lilypond' } " lilypond syntax
                                         " <F4> save & make & play midi
                                         " <F5> save & make dvi, midi, ps
                                         " <F6> view ps
                                         " <S-F6> view dvi
                                         " <F7> prev error
                                         " <F8> next error
                                         " <F9> make
                                         " <F10> menu (ordinary vim menu)
                                         " <F12> comment region
                                         " <S-F12> uncomment region

" Productivity
Plug 'dahu/vim-fanfingtastic'            " search mutliple lines
Plug 'kshenoy/vim-signature' " toggle, display and navigate marks
Plug 'troydm/zoomwintab.vim' " \z toggles zoom on windows
Plug 'tpope/vim-characterize' " reveals all the character info, Unicode included
Plug 'tpope/vim-commentary' " toggle comments
Plug 'tpope/vim-repeat' " extend repetitions by the 'dot' key
Plug 'tpope/vim-speeddating' " Smart and fast date changer
Plug 'tpope/vim-surround' " surround vim objects with a pair of identical chars
Plug 'tpope/vim-unimpaired'              " insert/move lines up/down
Plug 'tpope/vim-eunuch' " help for UNIX e.g. :Remove :SudoWrite :Move :Rename etc.
Plug 'junegunn/vim-peekaboo' " show registers in a sidebar
Plug 'hrsh7th/vim-vsnip' " snippets
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'jeffkreeftmeijer/vim-numbertoggle' " toggle between absolute and relative
Plug 'farmergreg/vim-lastplace' " open a file where you left it
" Plug 'PeterRincker/vim-argumentative' " Move function arguments
Plug 'simnalamburt/vim-mundo', { 'on' : 'MundoToggle'} " browse the undo tree
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-cheat40', { 'on' : 'Cheat40'}
" Append to the cheatsheat by editing ~/nvim/cheat40.txt
Plug 'jiangmiao/auto-pairs' " auto-close pairs of brackets

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Gruvbox
" Plug 'morhetz/gruvbox' " higher-contrast than solarized (F5 toggle background)
" Plug 'lifepillar/vim-gruvbox8' " higher-contrast than solarized (F5 toggle background)
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'

" Bling
Plug 'TaDaa/vimade' " Dim inactive windows
Plug 'rakr/vim-togglebg' " toggle background with <F5>
Plug 'vim-airline/vim-airline' " good-looking status line
Plug 'vim-airline/vim-airline-themes' " good-looking status line
Plug 'ryanoasis/vim-devicons' " Funky file-type icons etc.
Plug 'ntpeters/vim-better-whitespace' " highlight and remove trailing whitespace
Plug 'itchyny/vim-cursorword' " highlight the word under the cursor
Plug 'romgrk/barbar.nvim' " tab-bar that makes them moveable

" Text-objects
Plug 'jeanCarloMachado/vim-toop' " use text objects in custom functions
Plug 'kana/vim-textobj-entire' " ae, ie
Plug 'kana/vim-textobj-indent' " ai, ii, aI, iI
Plug 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
Plug 'kana/vim-textobj-line' " al, il
Plug 'kana/vim-textobj-underscore' " a_, i_
Plug 'kana/vim-textobj-user'

" Required:
call plug#end()

" Required:
filetype plugin indent on      " Indent and plugins by filetype

" END PLUGINS (administrated by vim-plug) }}}

" Neovim python environment {{{

let g:python3_host_prog = '/home/nacnudus/.virtualenvs/neovim-python3/bin/python'

" }}}

" topic-specific vimrc {{{

let g:nacvim_packages=[
            \'aesthetics',
            \'basic',
            \'code',
            \'copyediting',
            \'git',
            \'language-server',
            \'latex',
            \'registers',
            \'R',
            \'spelling',
            \'text',
            \'treesitter',
            \'windows'
            \]

for package in g:nacvim_packages
    let package_path = $NACVIM."/packages/".package.".vim"
    if filereadable(package_path)
        exec ':so ' package_path
    endif
endfor

" end topic-specific vimrc }}}

" Local vimrc configuration {{{

let s:local_vimrc = expand('~/.local.vimrc')
if filereadable(s:local_vimrc)
    exec ':so ' . s:local_vimrc
endif

" }}}

" Additional Configuration {{{

let s:after_vimrc = expand('~/.after.vimrc')
if filereadable(s:after_vimrc)
    exec ':so ' . s:after_vimrc
endif

" }}}
