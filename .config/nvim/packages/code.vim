" Tabs, whitespace and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=2                  " number of spaces per tab
set softtabstop=2              " number of spaces per soft-tab
set shiftwidth=2               " number of spaces for auto-indent
set textwidth=80
set colorcolumn=81

" Strip all whitespaces on saving based on filetype
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_whitelines_at_eof=1
let g:better_whitespace_filetypes_blacklist = ['csv', 'txt', 'diff', 'gitcommit', 'help']

" }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
augroup END

" }}}

" Nvim-completion-manager {{{

" Configure the completion chains
let g:completion_chain_complete_list = {
      \'default' : [
      \    {'complete_items': ['lsp']},
      \    {'complete_items': ['snippet']},
      \    {'complete_items': ['tabnine']},
      \    {'complete_items': ['ts']},
      \    {'complete_items': ['path']},
      \    {'complete_items': ['spel']},
      \    {'mode': '<c-p>'},
      \    {'mode': '<c-n>'}
      \]
      \}

" " map <c-p> or tab to manually trigger completion
" imap <silent> <c-p> <Plug>(completion_trigger)
" " nmap <tab> <Plug>(completion_smart_tab)
" " nmap <s-tab> <Plug>(completion_smart_s_tab)

" " " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Switch between completion sources
imap  <C-h> <Plug>(completion_next_source)
imap  <C-l> <Plug>(completion_prev_source)

" " matching strategies in priority order
" let g:completion_matching_strategy_list = ['fuzzy', 'substring', 'exact', 'all']
" let g:completion_trigger_on_delete = 1
" let g:completion_enable_auto_paren = 1

"  " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" " Supress the annoying completion messages:
" " don't give |ins-completion-menu| messages.  For example,
" " '-- XXX completion (YYY)', 'match 1 of 2', 'The only match',
" set shortmess+=c

" " When the <Enter> key is pressed while the popup menu is visible, it only hides
" " the menu. Use this mapping to hide the menu and also start a new line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" }}}

" Snippets {{{

" " Expand
" imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" " Expand or jump
" imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" " Jump forward or backward
" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" " If you want to use snippet for multiple filetypes, you can `g:vsip_filetypes` for it.
" let g:vsnip_filetypes = {}
" let g:vsnip_filetypes.javascriptreact = ['javascript']
" let g:vsnip_filetypes.typescriptreact = ['typescript']

" }}}

" vimcmdline {{{

let cmdline_in_buffer = 0 " use tmux
let cmdline_external_term_cmd = 'kitty %s &'
let cmdline_tmux_conf = "~/.tmux.conf" " use my own tmux.conf
let cmdline_map_start          = '<LocalLeader>s'
" let cmdline_map_send           = '<LocalLeader>l'
let cmdline_map_send_and_stay  = '<LocalLeader>ll'
let cmdline_map_source_fun     = '<LocalLeader>lf'
let cmdline_map_send_paragraph = '<LocalLeader>lp'
let cmdline_map_send_block     = '<LocalLeader>lb'
let cmdline_map_send_motion    = '<LocalLeader>lm'
let cmdline_map_quit           = '<LocalLeader>q'

" }}}

" python {{{

" " Autoformat Python on save
" autocmd BufWritePost *.py execute ':Black'

" }}}
