" VIM Setup {{{

" Folding {{{

set foldmethod=marker

" Default open all folds
set foldlevel=100

" Toggle folding
nnoremap \ za
vnoremap \ za

" }}}

" Cut/Paste {{{

" to/from the clipboard
map <Leader>y "+y
map <Leader>p "+P

" toggle paste mode
map <Leader>P :set invpaste<CR>

" }}}

" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

" }}}

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" Set the relative number for default
set number
set relativenumber

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" }}}

" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>

" get the word frequency in the text
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  let lst = []
  for [key,value] in items(frequencies)
    call add(lst, value."\t".key."\n")
  endfor
  call sort(lst)
  echo join(lst)
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
map <Leader>ef :Unite output:WordFrequency<CR>

" }}}

" END VIM SETUP }}}

" Assume double spaces after full stops
" http://stevelosh.com/blog/2012/10/why-i-two-space/
set cpo+=J

" delimitmate {{{

let delimitMate_expand_space = 1

" }}}

" easydigraph {{{

let g:EasyDigraph_nmap = '<Leader>dd'

" }}}

" Plugin Setup {{{

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.text = {
    \ 'description' : '           text edition
        \                                          ⌘ `e',
    \}
let g:unite_source_menu_menus.text.command_candidates = [
    \['▷ toggle search results highlight                            ⌘ ,eq',
        \'set invhlsearch'],
    \['▷ toggle line numbers                                        ⌘ ,l',
        \'call ToggleRelativeAbsoluteNumber()'],
    \['▷ toggle wrapping                                            ⌘ ,ew',
        \'call ToggleWrap()'],
    \['▷ show hidden chars                                          ⌘ ,eh',
        \'set list!'],
    \['▷ toggle fold                                                ⌘ /',
        \'normal za'],
    \['▷ open all folds                                             ⌘ zR',
        \'normal zR'],
    \['▷ close all folds                                            ⌘ zM',
        \'normal zM'],
    \['▷ copy to the clipboard                                      ⌘ ,y',
        \'normal ,y'],
    \['▷ paste from the clipboard                                   ⌘ ,p',
        \'normal ,p'],
    \['▷ toggle paste mode                                          ⌘ ,P',
        \'normal ,P'],
    \['▷ text statistics                                            ⌘ ,es',
        \'Unite output:normal\ ,es -no-cursor-line'],
    \['▷ show word frequency                                        ⌘ ,ef',
        \'Unite output:WordFrequency'],
    \['▷ show available digraphs',
        \'digraphs'],
    \['▷ insert lorem ipsum text',
        \'exe "Loremipsum" input("numero de palabras: ")'],
    \['▷ show current char info                                     ⌘ ga',
        \'normal ga'],
    \]
nnoremap <silent>[menu]e :Unite -silent -winheight=20 menu:text <CR>

" END Unite Menu }}}
