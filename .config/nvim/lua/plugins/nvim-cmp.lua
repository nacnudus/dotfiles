require('cmp').setup {
  mapping = {
    ["<CR>"] = require('cmp').mapping.confirm({
      behavior = require('cmp').ConfirmBehavior.Replace,
      select = true
    }),
    ["<C-c>"] = require('cmp').mapping.close(),
    ["<C-space>"] = require('cmp').mapping.complete(),
  },
  sources = {
    { name = 'buffer',
      opts = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'tags' },
    { name = 'emoji' },
    { name = 'spell' },
    { name = 'treesitter' },
    { name = "latex_symbols" },
  },
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[lua]",
        path = "[path]",
        emoji = "[emoji]",
        spell = "[spell]",
        tags = "[tags]",
        treesitter = "[TS]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end,
  },
}
