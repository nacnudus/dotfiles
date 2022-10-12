local keyopts = { noremap = true, silent = true }
vim.keymap.set({'n', 'v', 'o'}, '<C-h>', require('tree-climber').goto_parent, keyopts)
vim.keymap.set({'n', 'v', 'o'}, '<C-l>', require('tree-climber').goto_child, keyopts)
vim.keymap.set({'n', 'v', 'o'}, '<C-j>', require('tree-climber').goto_next, keyopts)
vim.keymap.set({'n', 'v', 'o'}, '<C-k>', require('tree-climber').goto_prev, keyopts)
vim.keymap.set({'v', 'o'}, 'in', require('tree-climber').select_node, keyopts)
-- vim.keymap.set('n', '>', require('tree-climber').swap_next, keyopts)
-- vim.keymap.set('n', '<', require('tree-climber').swap_prev, keyopts)
