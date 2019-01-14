" VIM Setup {{{

" Basic options {{{

scriptencoding utf-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is shown anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set ttimeoutlen=0               " toggle between modes almost instantly
set virtualedit=all             " to edit where there is no actual character
set scrolloff=7                 " buffer when scrolling
nnoremap Q <nop>                " Never go back to compatible mode
let g:terminal_scrollback_buffer_size=100000

" }}}

" Pane switching {{{

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" }}}

" Searching {{{

set showmatch                   " show pairs match
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" History and permanent undo levels {{{

set undofile
set undoreload=1000

" }}}

" Make a dir if it doesn't already exist {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.config/nvim/tmp/backup/
set undodir=$HOME/.config/nvim/tmp/undo/
set directory=$HOME/.config/nvim/tmp/swap/
set viminfo+=n$HOME/.config/nvim/tmp/viminfo

" make these dirs if they do not already exist
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Wildmenu {{{

set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=2                  " a tab = four spaces
set shiftwidth=2               " number of spaces for auto-indent
set softtabstop=2              " a soft-tab of four spaces

" set formatoptions=qrn1ct
" t - textwidth
"         c - comments (plus leader -- see :help comments)
"         q - allogw 'gq' to work
"         n - numbered lists
"         2 - keep second line indent
"         1 - single letter words on next line
"         r - (in mail) comment leader after
set textwidth=80
set colorcolumn=81

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent><Leader>ew :call ToggleWrap()<CR>

" Don't strip whitespaces for certain filetypes
" the plugin better_whitespace_filetypes_blacklist variable
" only affects the usage of the highlighting
" https://github.com/ntpeters/vim-better-whitespace/issues/53
fun! FiletypeFilteredStripWhitespace()
  " if &ft =~ 'markdown|csv'
  if index(map(['csv', 'diff', 'gitcommit', 'unite', 'qf', 'help'], '&ft =~ v:val'), 1) > -1
    return
  endif
  StripWhitespace
endfun

" Strip all whitespaces on saving based on filetype
autocmd BufWritePre * call FiletypeFilteredStripWhitespace()
"
"Remove all trailing whitespace by pressing F9
nnoremap <F9> :StripWhitespace<CR>

" Colorscheme {{{

set termguicolors
syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
call togglebg#map("<F5>")      " toggle dark and light with F5

" Solarized

" default value is "normal", Setting this option to "high" or "low" does use the
" same Solarized palette but simply shifts some values up or down in order to
" expand or compress the tonal range displayed.
let g:neosolarized_contrast = "high"

" Special characters such as trailing whitespace, tabs, newlines, when displayed
" using ":set list" can be set to one of three levels depending on your needs.
" Default value is "normal". Provide "high" and "low" options.
let g:neosolarized_visibility = "normal"

" I make vertSplitBar a transparent background color. If you like the origin solarized vertSplitBar
" style more, set this value to 0.
let g:neosolarized_vertSplitBgTrans = 0

" If you wish to enable/disable NeoSolarized from displaying bold, underlined or italicized
" typefaces, simply assign 1 or 0 to the appropriate variable. Default values:
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" colorscheme NeoSolarized

" " Gruvbox (higher-contrast dark/light similar to solarized
let g:gruvbox_contrast_dark     = 'low'
let g:gruvbox_contrast_light    = 'low'
let g:gruvbox_bold              = 1
let g:gruvbox_italic            = 1
let g:gruvbox_underline         = 1
let g:gruvbox_undercurl         = 1
let g:gruvbox_guisp_fallback    = 1

colorscheme gruvbox

" Lucius (high-contrast dark/light)
let g:lucius_style         = 'dark'
let g:lucius_contrast      = 'high'
let g:lucius_contrast_bg   = 'high'
let g:lucius_use_bold      = 1
let g:lucius_use_underline = 1
let g:lucius_no_term_bg    = 0
" then do one of LuciusBlack LuciusDark LuciusLight LuciusWhite

" colorscheme lucius

" colorscheme base16-default-dark

" colorscheme onehalfdark

" }}}

" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" }}}

" Fast window & buffer close and kill {{{

" from http://stackoverflow.com/a/4468491/937932, close buffer without closing window
nmap <silent> <leader>k :bp\|bd #<CR>
nnoremap <silent><Leader>K :bd<CR>

" }}}

" Autoload configuration when this file changes ($NACVIMRC) {{{

" autocmd! BufWritePost vimrc source %
" autocmd! BufWritePost *.vimrc source ~/.vimrc

" }}}

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}

" Quick exiting without save {{{

nnoremap <Leader>`` :qa!<CR>

" }}}

" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" }}}

" Make the Y behavior similar to D & C {{{

nnoremap Y y$

" }}}

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=nc
endif

" Use vim-snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" vimagit {{{

let g:magit_show_help=0

" }}}


" return to last position on open {{{
"
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" }}}
