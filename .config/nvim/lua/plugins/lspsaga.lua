require('lspsaga').init_lsp_saga()

-- code action
vim.api.nvim_set_keymap('n', '<Leader>ca', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>ca', '<cmd><C-U>lua require("lspsaga.codeaction").range_code_action()<CR>', { noremap = true, silent = true })

-- lsp provider to find the cursor word definition and reference
vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>', { noremap = true, silent = true })

-- show hover doc (buggy 2021-10-13)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', { noremap = true, silent = true })

-- show signature help
vim.api.nvim_set_keymap('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', { noremap = true, silent = true })

-- rename
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua require("lspsaga.rename").rename()<CR>', { noremap = true, silent = true })

-- preview definition
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', { noremap = true, silent = true })

-- show
vim.api.nvim_set_keymap('n', '<Leader>cd', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>cc', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>', { noremap = true, silent = true })

-- jump diagnostic
vim.api.nvim_set_keymap('n', '[e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', { noremap = true, silent = true })

-- scroll down hover doc or scroll in definition preview
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', { noremap = true, silent = true })
-- scroll up hover doc
vim.api.nvim_set_keymap('n', '<C-b>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', { noremap = true, silent = true })
