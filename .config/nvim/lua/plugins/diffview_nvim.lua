-- Mappings similar to opening and closing fugitive
vim.api.nvim_set_keymap(
  'n',
  '<Leader>dd',
  '<cmd>DiffviewOpen<cr>',
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  'dq',
  '<cmd>DiffviewClose<cr>',
  { noremap = true, silent = true }
)
