-- require('cmp').setup {
--   mapping = {
--     ["<TAB>"] = require('cmp').mapping.confirm({
--       behavior = require('cmp').ConfirmBehavior.Replace,
--       select = true
--     }),
--     ["<C-c>"] = require('cmp').mapping.close(),
--     ["<C-space>"] = require('cmp').mapping.complete(),
--   },
--   sources = require('cmp').config.sources({
--     { name = 'buffer',
--       option = {
--         get_bufnrs = function()
--           return vim.api.nvim_list_bufs()
--         end
--       }
--     },
--     { name = 'nvim_lsp' },
--     { name = 'nvim_lua' },
--     { name = 'path' },
--     { name = 'emoji' },
--     { name = 'spell' },
--     { name = 'tags' },
--     { name = 'treesitter' },
--     { name = "latex_symbols" },
--   }),
--   formatting = {
--     format = function(entry, vim_item)
--       -- fancy icons and a name of kind
--       vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

--       -- set a name for each source
--       vim_item.menu = ({
--         buffer = "[buffer]",
--         nvim_lsp = "[LSP]",
--         nvim_lua = "[lua]",
--         path = "[path]",
--         emoji = "[emoji]",
--         spell = "[spell]",
--         tags = "[tags]",
--         treesitter = "[TS]",
--         latex_symbols = "[LaTeX]",
--       })[entry.source.name]
--       return vim_item
--     end,
--   },
-- }

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'cmp_nvim_r' },
      { name = 'nvim_lua' },
      { name = 'nvim_lsp' },
      { name = 'treesitter' },
      { name = 'buffer' },
      { name = 'emoji' },
      { name = 'latex_symbols' },
      { name = 'path' },
      { name = 'spell' },
      { name = 'tags' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
