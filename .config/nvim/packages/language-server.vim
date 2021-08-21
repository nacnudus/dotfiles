" General setup
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "r_language_server", "julials" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Activate R
lua << EOF
  require'lspconfig'.r_language_server.setup{
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r", "rmd" },
    log_level = 2,
    -- root_dir = root_pattern(".git") or os_homedir
  }
EOF
"
" Activate python
lua << EOF
  require'lspconfig'.pyright.setup{}
EOF

" Activate julia
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

" Activate completion everywhere
autocmd BufEnter * setlocal omnifunc=v:lua.vim.lsp.omnifunc
" autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" " Possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
" let g:completion_enable_snippet = 'vim-vsnip'

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
