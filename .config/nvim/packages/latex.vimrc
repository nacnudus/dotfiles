" Compile using funny fonts (especially for work stuff)
let R_latexcmd = 'latexmk -pdf -pdflatex="xelatex %O -synctex=1 %S"'

" Clean on exit
augroup vimtex_config
  au!
  au User VimtexEventQuit     VimtexClean
  " au User VimtexEventInitPost VimtexCompile
augroup END

