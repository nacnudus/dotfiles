--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_statusline_style = 'original'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_background = 'medium' -- 'hard', 'medium', 'soft'
vim.cmd [[colorscheme gruvbox-material]]

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' ' -- global commands
vim.g.maplocalleader = ',' -- filetype-specific commands

--Remap jk as escape key to get into normal mode
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'jk', '<ESC>', { noremap = true, silent = true })

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Python executables and environments
-- disable python2 support
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = '/home/nacnudus/.virtualenvs/neovim-python3/bin/python'
