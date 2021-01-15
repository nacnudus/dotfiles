" Activate language servers
lua << EOF
    require'lspconfig'.julials.setup{}
    require'lspconfig'.r_language_server.setup{}
    require'lspconfig'.pyls.setup{}
    require'lspconfig'.sqlls.setup{}
    require'lspconfig'.bashls.setup{}
EOF

" Mappings
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> rn        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>e <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

"map <c-p> to manually trigger completion
"imap <silent> <c-p> <Plug>(completion_trigger)

" Activate completion everywhere
" autocmd BufEnter * setlocal omnifunc=v:lua.vim.lsp.omnifunc
" autocmd BufEnter * lua require'completion'.on_attach()

" Autoformat Python on save
" autocmd BufWritePost *.py execute ':Black'

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" " Possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
" let g:completion_enable_snippet = 'vim-vsnip'

" " Avoid showing message extra message when using completion
" set shortmess+=c

" " Statusline
" lua << END
"     -- local lsp_status = require('lsp-status')
"     -- lsp_status.register_progress()
"     -- local nvim_lsp = require('nvim_lsp')
" END

" function! LspStatus() abort
"   if luaeval('#vim.lsp.buf_get_clients() > 0')
"     return luaeval("require('lsp-status').status()")
"   endif

"   return ''
" endfunction
