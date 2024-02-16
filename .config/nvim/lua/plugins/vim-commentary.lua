vim.api.nvim_set_keymap('n', '<leader>c', '<Plug>CommentaryLine', {})
vim.api.nvim_set_keymap('x', '<leader>c', '<Plug>Commentary', {})

-- Comment string for sql
vim.cmd('autocmd FileType sql setlocal commentstring=--\\ %s')
