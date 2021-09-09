-- Gitsigns
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_', show_count = true },
    topdelete = { text = '‾', show_count = true },
    changedelete = { text = '_̴', show_count = true, hl = 'GitSignsDelete' },
  },
  word_diff = true
}
