-- Strip all whitespaces on saving based on filetype
vim.g.better_whitespace_enabled = 0 -- leave visualisation to the treesitter plugins
vim.g.strip_whitespace_on_save = 1
vim.g.strip_whitespace_confirm = 0
vim.g.strip_whitelines_at_eof = 1
vim.g.better_whitespace_filetypes_blacklist  =  {'csv', 'txt', 'diff', 'gitcommit', 'help'}
