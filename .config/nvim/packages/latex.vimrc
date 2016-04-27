" Compile using funny fonts (especially for work stuff)
let R_latexcmd = 'latexmk -pdf -pdflatex="xelatex %O -synctex=1 %S"'

" Disable insert-mode backtick mappings for maths symbols (delays actual
" backticks, and I can't think of a good alternative key)
let g:vimtex_imaps_enabled = 0

" Disable squishing of commands into symbols
set conceallevel=0

" Clean on exit
augroup vimtex_config
  au!
  au User VimtexEventQuit     VimtexClean
  " au User VimtexEventInitPost VimtexCompile
augroup END

