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

-- Use fzf for extended syntax such as exact matches
-- https://github.com/junegunn/fzf#search-syntax
-- | Token     | Match type                 | Description                          |
-- | --------- | -------------------------- | ------------------------------------ |
-- | `sbtrkt`  | fuzzy-match                | Items that match `sbtrkt`            |
-- | `'wild`   | exact-match (quoted)       | Items that include `wild`            |
-- | `^music`  | prefix-exact-match         | Items that start with `music`        |
-- | `.mp3$`   | suffix-exact-match         | Items that end with `.mp3`           |
-- | `!fire`   | inverse-exact-match        | Items that do not include `fire`     |
-- | `!^music` | inverse-prefix-exact-match | Items that do not start with `music` |
-- | `!.mp3$`  | inverse-suffix-exact-match | Items that do not end with `.mp3`    |
require('telescope').load_extension('fzf')

-- Preview images, pdfs, thumbnails, epubs
require('telescope').load_extension('media_files')

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
