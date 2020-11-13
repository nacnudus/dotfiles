" Use custom .tmux.conf
let R_notmuxconf = 1

" Don't use the nvim terminal emulator
let R_external_term = 1
let R_applescript = 0
let R_notmuxconf = 1 " Use my own tmux, which allows mouse scroll

" Use Alt+- to create <- as in Rstudio
let R_assign_map = "<M-->"

let rout_follow_colorscheme = 1 " Doesn't seem to work
let R_commented_lines = 1 " Include commented lines when sending to console
let R_clear_line = 1 " Delete existing stuff on command line before sending command to R
let g:rplugin_pdfviewer = "zathura"
let R_rmd_environment = "new.env()" " compile .Rmd in a fresh environment

" Don't jump to the line being debugged by browser()
let R_debug = 0

" Highlight chunk headers as R code
let rrst_syn_hl_chunk = 1
let rmd_syn_hl_chunk = 1

if $DISPLAY != ""
  let R_openpdf = 1
  let R_openhtml = 1
endif

" let R_csv_app = 'terminal:sc-im'  " view data frames in sc-im in terminal, doesn't work
" let R_csv_app = 'localc' " view data frames in libreoffice
let R_csv_app = 'tmux new-window vd'  " view data frames in excel

let R_pdfviewer = "zathura"
let g:R_insert_mode_cmds = 0 " Don't use Nvim-R commands in insert mode
let R_nvim_wd = 1 " use the Nvim working directory, not that of the file
let R_pdfviewer = "zathura"
let r_syntax_folding = 1
set nofoldenable
let Rout_more_colors = 1 " highlight R commands in output as they are in scripts
let g:rmd_fenced_languages = ['r', 'python']
let g:markdown_fenced_languages = ['r', 'python']
let R_non_r_compl = 0 " use omni completion provided by annother plugin

nnoremap <silent> <LocalLeader>sw :call SendCmdToR("setwidth()")<CR>
nnoremap <silent> <LocalLeader>gl :call RAction("dplyr::glimpse")<CR>
nnoremap <silent> <LocalLeader>rP :call RAction("print_tibble_inf")<CR>

" tags
autocmd FileType r set tags+=~/.config/nvim/plugged/Nvim-R/Rtags,~/.config/nvim/plugged/Nvim-R/RsrcTags
autocmd FileType rmd set tags+=~/.config/nvim/plugged/Nvim-R/Rtags,~/.config/nvim/plugged/Nvim-R/RsrcTags
autocmd FileType rnoweb set tags+=~/.config/nvim/plugged/Nvim-R/Rtags,~/.config/nvim/plugged/Nvim-R/RsrcTags

" Close R without saving on vim exit
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
