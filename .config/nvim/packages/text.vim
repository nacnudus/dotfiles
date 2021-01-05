" Toggle folding
nnoremap \ za
vnoremap \ za

" Cut/paste to/from the system clipboard
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

" Un-wrap (opposite of gq)
" TODO: map this to gQ, e.g. gQip to unwrap a paragraph
function! Unwrap(str)
  let oldtextwidth=&textwidth
  let oldtextwidth=9999
  execute "normal! gq" . a:str
  let &textwidth=oldtextwidth
endfun
call toop#mapFunction('Unwrap', "gQ")

nnoremap gQ :set opfunc=CountSpaces<CR>g@
vnoremap gQ :<C-U>call CountSpaces(visualmode(), 1)<CR>

function! CountSpaces(type, ...)
  let textwidth_save = &textwidth
  let sel_save = &selection
  let reg_save = @@

  let &selection = "inclusive"
  let &textwidth = 9999

  if a:0  " Invoked from Visual mode, use '< and '> marks.
    silent exe "normal! `<" . a:type . "`>gq"
  elseif a:type == 'line'
    silent exe "normal! '[V']gq"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]gq"
  else
    silent exe "normal! `[v`]gq"
  endif

  let &textwidth=textwidth_save
  let &selection = sel_save
  let @@ = reg_save
endfunction
