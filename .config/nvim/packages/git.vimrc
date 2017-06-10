
" Plugin Setup {{{

" Fugitive {{{

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>
" }}}

" Gitv {{{

nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
" let g:Gitv_WrapLines = 1

autocmd FileType git set nofoldenable

" }}}

" GitHub dashboard {{{

nnoremap <Leader>gD :exe 'GHD! '.input("Username: ")<CR>
nnoremap <Leader>gA :exe 'GHA! '.input("Username or repository: ")<CR>

let g:github_dashboard = {}

" Dashboard window position
" - Options: tab, top, bottom, above, below, left, right
" - Default: tab
let g:github_dashboard['position'] = 'top'

" Disable Emoji output
" - Default: only enable on terminal Vim on Mac
let g:github_dashboard['emoji'] = 1

" Customize emoji (see http://www.emoji-cheat-sheet.com/)
let g:github_dashboard['emoji_map'] = {
\   'user_dashboard': 'blush',
\   'user_activity':  'smile',
\   'repo_activity':  'laughing',
\   'ForkEvent':      'fork_and_knife'
\ }

" Command to open link URLs
" - Default: auto-detect
let g:github_dashboard['open_command'] = 'open'

" API timeout in seconds
" - Default: 10, 20
let g:github_dashboard['api_open_timeout'] = 10
let g:github_dashboard['api_read_timeout'] = 20

" Do not set statusline
" - Then you can customize your own statusline with github_dashboard#status()
let g:github_dashboard['statusline'] = 0

" GitHub Enterprise
let g:github_dashboard['api_endpoint'] = 'http://github.mycorp.com/api/v3'
let g:github_dashboard['web_endpoint'] = 'http://github.mycorp.com'

" }}}

" END Plugin Setup }}}

" Unite Menu {{{
let g:unite_source_menu_menus.git = {
    \ 'description' : '            admin git repositories
        \                                ⌘ [space]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git viewer             (gitv)                              ⌘ ,gv',
        \'normal ,gv'],
    \['▷ git viewer - buffer    (gitv)                              ⌘ ,gV',
        \'normal ,gV'],
    \['▷ git status             (fugitive)                          ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff               (fugitive)                          ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit             (fugitive)                          ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log                (fugitive)                          ⌘ ,gl',
        \'exe "silent Glog | Unite -no-quit quickfix"'],
    \['▷ git log - all          (fugitive)                          ⌘ ,gL',
        \'exe "silent Glog -all | Unite -no-quit quickfix"'],
    \['▷ git blame              (fugitive)                          ⌘ ,gb',
        \'Gblame'],
    \['▷ git add/stage          (fugitive)                          ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout           (fugitive)                          ⌘ ,go',
        \'Gread'],
    \['▷ git rm                 (fugitive)                          ⌘ ,gR',
        \'Gremove'],
    \['▷ git mv                 (fugitive)                          ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push               (fugitive, buffer output)           ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull               (fugitive, buffer output)           ⌘ ,gP',
        \'Git! pull'],
    \['▷ git command            (fugitive, buffer output)           ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git edit               (fugitive)                          ⌘ ,gE',
        \'exe "command Gedit " input(":Gedit ")'],
    \['▷ git grep               (fugitive)                          ⌘ ,gg',
        \'exe "silent Ggrep -i ".input("Pattern: ") | Unite -no-quit quickfix'],
    \['▷ git grep - messages    (fugitive)                          ⌘ ,ggm',
        \'exe "silent Glog --grep=".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git grep - text        (fugitive)                          ⌘ ,ggt',
        \'exe "silent Glog -S".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git init                                                   ⌘ ,gn',
        \'Unite output:echo\ system("git\ init")'],
    \['▷ git cd                 (fugitive)',
        \'Gcd'],
    \['▷ git lcd                (fugitive)',
        \'Glcd'],
    \['▷ git browse             (fugitive)                          ⌘ ,gB',
        \'Gbrowse'],
    \['▷ github dashboard       (github-dashboard)                  ⌘ ,gD',
        \'exe "GHD! " input("Username: ")'],
    \['▷ github activity        (github-dashboard)                  ⌘ ,gA',
        \'exe "GHA! " input("Username or repository: ")'],
    \['▷ github issues & PR                                         ⌘ ,gS',
        \'normal ,gS'],
    \]
nnoremap <silent>[menu]g :Unite -silent -winheight=29 -start-insert menu:git<CR>

" END Unite Menu }}}
