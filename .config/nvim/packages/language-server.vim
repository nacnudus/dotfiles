" Activate language servers
lua << EOF
    require'lspconfig'.r_language_server.setup{}
    require'lspconfig'.pyls.setup{}
    require'lspconfig'.sqlls.setup{}
    require'lspconfig'.bashls.setup{}

    -- For debugging
    -- vim.lsp.set_log_level("debug")

    -- Then in the command line, check whether the server is running.
    -- :lua print(vim.lsp.buf.server_ready())

    -- If not, read the log
    -- :lua vim.cmd('e'..vim.lsp.get_log_path()
EOF

" Activate julia specifically
lua << EOF
  require'lspconfig'.julials.setup{
      on_new_config = function(new_config,new_root_dir)
        server_path = "/home/nacnudus/.julia/packages/LanguageServer/y1ebo/src"
        cmd = {
          "julia",
          "--project="..server_path,
          "--startup-file=no",
          "--history-file=no",
          "-e", [[
            using Pkg;
            Pkg.instantiate()
            using LanguageServer; using SymbolServer;
            depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
            project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
            # Make sure that we only load packages from this environment specifically.
            @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
            server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
            server.runlinter = true;
            run(server);
          ]]
      };
        new_config.cmd = cmd
      end
  }
EOF

" Mappings
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gtd       <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gR        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gn        <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gp        <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> go        <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <leader>e <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

" map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

" Activate completion everywhere
autocmd BufEnter * setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'vim-vsnip'

" Avoid showing message extra message when using completion
set shortmess+=c

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
"
"   return ''
" endfunction
