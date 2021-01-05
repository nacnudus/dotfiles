" Airline {{{
" For some reason, this has to be in this file, not in /packages/foo.vim

set noshowmode " Don't show the default mode indicator

let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#branc#enable=1
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

" Gruvbox {{{
" (higher-contrast dark/light similar to solarized

set termguicolors
set background=dark            " set a dark background

syntax enable                  " enable the syntax highlight

colorscheme gruvbox8_soft

call togglebg#map("<F5>")      " toggle dark and light with F5

let g:gruvbox_contrast_dark      = 'soft'
let g:gruvbox_contrast_light     = 'soft'
let g:gruvbox_bold               = 1
let g:gruvbox_italics            = 1
let g:gruvbox_italicize_strings  = 1
let g:gruvbox_filetype_hi_groups = 0
let g:gruvbox_plugin_hi_groups   = 0
let g:gruvbox_transp_bg          = 0
