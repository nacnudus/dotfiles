-- Telescope
vim.api.nvim_set_keymap('n', '<leader>t', ':Telescope<CR>', {})
vim.api.nvim_set_keymap('x', '<leader>t', ':Telescope<CR>', {})

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    layout_strategy = 'flex',
  },
}
