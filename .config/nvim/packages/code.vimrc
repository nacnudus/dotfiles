" VIM Setup {{{

" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}

" Tagbar {{{
nmap <F8> :TagbarToggle<CR>

" R functionality
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
" }}}
"
" Pretty XML {{{
map @@x !xmllint --format --recover -
" au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"
" }}}

" FILETYPES  {{{ ==============================================================

" R {{{

" Don't use the nvim terminal emulator
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_notmuxconf = 1 " Use my own tmux, which allows mouse scroll


" Open RStudio and connect to that instance
" let RStudio_cmd = '/usr/bin/rstudio-bin'

" Use Alt+- to create <- as in Rstudio
let R_assign_map = "<M-->"
let rout_follow_colorscheme = 1 " Doesn't seem to work
let R_commented_lines = 1 " Include commented lines when sending to console
let R_clear_line = 1 " Delete existing stuff on command line before sending command to R
let g:rplugin_pdfviewer = "zathura"
let R_args_in_stline = 1 " Show function arguments in status line
let R_rmd_environment = "new.env()" " compile .Rmd in a fresh environment

" Highlight chunk headers as R code
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1


if $DISPLAY != ""
  let R_openpdf = 1
  let R_openhtml = 1
endif

let R_pdfviewer = "zathura"
let g:R_insert_mode_cmds = 0 " Don't use Nvim-R commands in insert mode
let R_restart = 1 " restart R on \rf (only works in external terminal
let R_wait = 100 " Don't wait long for nvimcom to load
let R_nvim_wd = 1 " use the Nvim working directory, not that of the file
let R_pdfviewer = "zathura"
let r_syntax_folding = 1
set nofoldenable

" Use Ctrl+Space to do omnicompletion:
if has("gui_running")
   inoremap <C-Space> <C-x><C-o>
else
   inoremap <Nul> <C-x><C-o>
endif

nnoremap <silent> <LocalLeader>sw :call SendCmdToR("setwidth()")<CR>
nnoremap <silent> <LocalLeader>fs :call SendCmdToR("options(width = 211L)")<CR>
nnoremap <silent> <LocalLeader>gl :call RAction("dplyr::glimpse")<CR>

" tags
autocmd FileType r set tags+=~/.config/nvim/plugged/Nvim-R/Rtags,~/.config/nvim/plugged/Nvim-R/RsrcTags
autocmd FileType rmd set tags+=~/.config/nvim/plugged/Nvim-R/Rtags,~/.config/nvim/plugged/Nvim-R/RsrcTags
autocmd FileType rnoweb set tags+=~/.config/nvim/plugged/Nvim-R/Rtags,~/.config/nvim/plugged/Nvim-R/RsrcTags

" }}}

" AutoFormat {{{ -------------------------------------------------------------

noremap <F3> :Autoformat<CR>
autocmd Filetype r,rmd noremap <F3> :Rformat<CR>

" }}}

" JSON {{{ -------------------------------------------------------------------

" autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.json set ft=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" MARKDOWN {{{

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown

" }}}

" " SML {{{
   autocmd FileType sml setlocal commentstring=(*\ %s\ *)
" " }}}

" Syntastic {{{

nmap <silent><Leader>S :SyntasticCheck<CR>:Errors<CR>
nmap <silent><Leader>R :SyntasticReset<CR>

" Symbols
let g:syntastic_enable_signs = 1
let g:syntastic_enable_highlighting=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'
" ✍ ✏︎ ✒︎ ✄ ✂︎ ☕︎ ✑ ☹ ⚡︎ ☞

" Checkers and styles
let g:syntastic_python_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = 1
let g:syntastic_r_checkers = ['lintr']
" If speed is a problem, specify less intensive checking with the line below
" let g:syntastic_r_lint_styles = 'list(spacing.indentation.notabs, spacing.indentation.evenindent)'
let g:syntastic_tex_checkers = ['lacheck', 'chktex']

" Only check syntax on demand (passive)
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['tex'] }

" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
augroup END

" }}}

" Deoplete {{{

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_list = 30
let g:deoplete#min_keyword_length = 1
let g:deoplete#sources#syntax#min_keyword_length = 1
let g:deoplete#data_directory = $OH_MY_VIM.'/tmp/deoplete'

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:deoplete#enable_auto_select = 0

" toggle the auto select feature
function! Toggledeoplete()
  if !g:deoplete#disable_auto_complete && g:deoplete#enable_auto_select
      let g:deoplete#disable_auto_complete = 0
      let g:deoplete#enable_auto_select = 0
  elseif !g:deoplete#disable_auto_complete && !g:deoplete#enable_auto_select
      let g:deoplete#disable_auto_complete = 1
      let g:deoplete#enable_auto_select = 0
  elseif g:deoplete#disable_auto_complete && !g:deoplete#enable_auto_select
      let g:deoplete#disable_auto_complete = 0
      let g:deoplete#enable_auto_select = 1
  endif
endfunction

nnoremap <silent><Leader>ea :call Toggledeoplete()<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:deoplete#sources#omni#input_patterns')
    let g:deoplete#sources#omni#input_patterns = {}
endif
if !exists('g:deoplete#sources#omni#functions')
  let g:deoplete#sources#omni#functions = {}
endif

let g:neopairs#enable=1

" R (plugin: Nvim-R)
let g:deocomplcache_enable_force_overwrite_completefunc = 1
let g:deoplete#sources#omni#input_patterns.r = '[[:alnum:].\\]\+'
let g:deoplete#sources#omni#functions.r = 'rcomplete#CompleteR'
set completeopt=menuone,preview

" Haskell
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse = 1

" Python
let g:python_host_prog = '/home/nacnudus/miniconda3/envs/neovim2/bin/python'
let g:python3_host_prog = '/home/nacnudus/miniconda3/envs/neovim3/bin/python'
" let g:deoplete#sources#omni#input_patterns.python='[^. \t]\.\w*'
let g:deoplete#sources#jedi#python_path = '/home/nacnudus/miniconda3/bin/python'
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#show_call_signatures = 0

"" C completion
"let g:clang_complete_auto = 0
"let g:clang_auto_select = 0
"let g:clang_default_keymappings = 0
""let g:clang_use_library = 1


" Tab completion
inoremap <silent><expr><Tab> pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()
	" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deolete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"


" }}}

" END Plugin Setup }}}

" Unite Menu {{{

let g:unite_source_menu_menus.code = {
    \ 'description' : '           coding
        \                                                ⌘ `c',
    \}
let g:unite_source_menu_menus.code.command_candidates = [
    \['▷ toggle auto-completion state (manual → disabled → auto)    ⌘ ,ea',
        \'call Toggledeoplete()'],
    \['▷ syntastic toggle                           (syntastic)     ⌘ ,S',
        \'SyntasticToggleMode ,S'],
    \['▷ syntastic check & errors                   (syntastic)     ⌘ ,N',
        \'normal ,N'],
    \['▷ count lines of code',
        \'Unite -default-action= output:call\\ LinesOfCode()'],
    \['▷ toggle indent lines                                        ⌘ ,L',
        \'IndentLinesToggle'],
    \]
nnoremap <silent>[menu]c :Unite -silent menu:code<CR>

" END Unite Menu }}}

