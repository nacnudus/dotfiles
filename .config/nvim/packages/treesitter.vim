lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained", or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
      -- disable = { "c", "rust" },  -- list of language that will be disabled
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "ts",
        node_incremental = "ti",
        node_decremental = "tI",
        scope_incremental = "tS",
      },
    },
    indent = {
      enable = true
    },
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = true },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "tR",
        },
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "td",
          list_definitions = "tr",
          list_definitions_toc = "tO",
          goto_next_usage = "tn",
          goto_previous_usage = "tp",
        },
      },
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["aC"] = "@comment.outer",
          ["id"] = "@conditional.inner",
          ["ad"] = "@conditional.outer",
          ["iL"] = "@loop.inner",
          ["aL"] = "@loop.outer",
          ["i<"] = "@parameter.inner",
          ["a<"] = "@parameter.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          [">,"] = "@parameter.inner",
        },
        swap_previous = {
          ["<,"] = "@parameter.inner",
        },
      },
      lsp_interop = {
        enable = true,
        peek_definition_code = {
          ["df"] = "@function.outer",
          ["dF"] = "@class.outer",
        },
      },
    },
    rainbow = {
      enable = true
    }
  }
EOF

" Syntax-based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
