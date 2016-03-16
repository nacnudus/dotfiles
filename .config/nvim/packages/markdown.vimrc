" VIM Setup {{{

" END VIM SETUP }}}

" Plugin Setup {{{

" Vim-markdown-extra-preview {{{

map <LocalLeader>mp :Me<CR>
map <LocalLeader>mr :Mer<CR>

let g:VMEPextensions = ['extra', 'codehilite']
" This is for Mac only, need a program accept html file as parameter
let g:VMEPhtmlreader= 'open'
" Enable maths
let g:vim_markdown_math = 1
" Autofit table of contents
let g:vim_markdown_toc_autofit = 1
" YAML highlighting
let g:vim_markdown_frontmatter = 1
" List indent 2
let g:vim_markdown_new_list_item_indent = 2



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
