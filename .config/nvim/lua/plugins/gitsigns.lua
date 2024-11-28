-- Gitsigns
require('gitsigns').setup {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_', show_count = true },
    topdelete    = { text = '‾', show_count = true },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = true,  -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = true,  -- Toggle with `:Gitsigns toggle_word_diff`, requires internal = true
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  on_attach = function(bufnr)
    vim.api.nvim_set_hl(0, 'GitSignsChangedelete', { link = 'GitSignsDelete' })
    -- Setup keymaps
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']h', '<cmd>lua require"gitsigns".next_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[h', '<cmd>lua require"gitsigns".prev_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>hs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>hr', '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hR', '<cmd>lua require"gitsigns".reset_buffer()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', { noremap = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line()<CR>', { noremap = true })
  end,
  diff_opts = {
    internal = true, -- Required by word_diff
    line_match = true
  },
}
