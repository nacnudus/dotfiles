" turn on the spell checking and set the English language
nmap <Leader>sg :setlocal spell spelllang=en_gb<CR>
nmap <Leader>sz :setlocal spell spelllang=en_nz<CR>
nmap <Leader>su :setlocal spell spelllang=en_us<CR>
" add science dictionaries
nmap <Leader>Sg :setlocal spell spelllang=en_gb,scienceuk<CR>
nmap <Leader>Sz :setlocal spell spelllang=en_nz,scienceuk<CR>
nmap <Leader>Su :setlocal spell spelllang=en_us,scienceus<CR>
" use a dictionary in the local folder (which will be created if it doesn't exist)
nmap <Leader>sl :setlocal spell spellfile=./local.utf-8.add<CR>
nmap <Leader>sL :mkspell! ./local.utf-8.add<CR>
" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
nmap <Leader>sp z=
" jump to the next bad spell word and suggests a correct one
nmap <Leader>sc ]sz=
" add word to the dictionary
nmap <Leader>sa zg

" Spelling highlighting
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=undercurl cterm=undercurl
highlight clear SpellCap
highlight SpellCap term=standout ctermfg=1 term=undercurl cterm=undercurl
highlight clear SpellRare
highlight SpellRare term=standout ctermfg=1 term=undercurl cterm=undercurl
highlight clear SpellLocal
highlight SpellLocal term=standout ctermfg=1 term=undercurl cterm=undercurl

" LanguageTool grammar checking
let g:languagetool_jar='/home/nacnudus/languagetool/languagetool-commandline.jar'
" Disable spellchecking in LanguageTool
let g:languagetool_disable_rules='WHITESPACE_RULE,EN_QUOTES,MORFOLOGIK_RULE_EN_US,EN_QUOTES,COMMA_PARENTHESIS_WHITESPACE,UPPERCASE_SENTENCE_START,SENT_START_CONJUNCTIVE_LINKING_ADVERB_COMMA,ALL_OF_THE,IN_A_X_MANNER,SOME_OF_THE,BOTH_AS_WELL_AS,EN_UNPAIRED_BRACKETS,DOUBLE_PUNCTUATION,CURRENCY,MORFOLOGIK_RULE_EN_GB,ENGLISH_WORD_REPEAT_BEGINNING_RULE,LARGE_NUMBER_OF,ALSO_OTHER,NUMEROUS_DIFFERENT,SENTENCE_WHITESPACE,EN_GB_SIMPLE_REPLACE,SO_AS_TO,LITTLE_BIT,SMALL_NUMBER_OF,WITH_THE_EXCEPTION_OF'
