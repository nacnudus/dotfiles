" VIM Setup {{{

" END VIM SETUP }}}

" Plugin Setup {{{

" vim-livedown {{{

nnoremap gm :LivedownToggle<CR>

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.markdown = {
    \ 'description' : '       preview markdown extra docs
        \                           ⌘ [space]k',
    \}
let g:unite_source_menu_menus.markdown.command_candidates = [
    \['▷ preview',
        \'Me'],
    \['▷ refresh',
        \'Mer'],
    \]
nnoremap <silent>[menu]k :Unite -silent menu:markdown<CR>

" END Unite Menu }}}

let g:pandoc#syntax#codeblocks#embeds#langs = ["r", "python", "md", "markdown", "txt"]

