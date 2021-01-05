" lua << EOF
"     -- require'nvim-treesitter.configs'.setup {
"     --   ensure_installed = "maintained", -- one of "all", "maintained", or a list of languages
"     --   highlight = {
"     --     enable = false,              -- false will disable the whole extension
"     --     -- disable = { "c", "rust" },  -- list of language that will be disabled
"     --   },
"     --   incremental_selection = {
"     --     enable = true,
"     --     keymaps = {
"     --       init_selection = "gnn",
"     --       node_incremental = "grn",
"     --       scope_incremental = "grc",
"     --       node_decremental = "grm",
"     --     },
"     --   },
"     --   indent = {
"     --     enable = true
"     --   }
"     -- }
" EOF

" Syntax-based folding
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
