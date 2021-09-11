-- Telescope
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

-- Leader mappings

-- Open Telescope with a list of things it can do
vim.api.nvim_set_keymap('n', '<leader>tt', [[<cmd>lua require('telescope.builtin').builtin()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('x', '<leader>tt', [[<cmd>lua require('telescope.builtin').builtin()<CR>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tb', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tg', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tz', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t/', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>to', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })
