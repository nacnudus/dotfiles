require('cmp').setup {
  mapping = {
    ['<C-y>'] = require('cmp').mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'tags' },
    { name = 'emoji' },
    { name = 'spell' },
    { name = 'treesitter' },
    { name = "latex_symbols" },
  }
}
