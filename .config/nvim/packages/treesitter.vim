lua << EOF
  require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained", or a list of languages
    ignore_install = { "teal", "gdscript" }, -- List of parsers to ignore installing

    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },

    highlight = {
      enable = true, -- false will disable the whole extension
      -- disable = { "r" }, -- list of languages that will be disabled
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        node_decremental = "gcn",
        scope_incremental = "grc",
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
          smart_rename = "grr",
        },
      },
      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gtO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
    },

    textobjects = {
      -- Many more text objects are available
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects#built-in-textobjects
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
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
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
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
      -- colors = {} -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },

    require'treesitter-context.config'.setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    }
  }
EOF

" Syntax-based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
