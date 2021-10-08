--Don't open files folded
vim.o.foldenable = false

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
vim.g.mapleader = ',' -- global commands
vim.g.maplocalleader = ' ' -- filetype-specific commands

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

-- Make Y similar to D & C
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true, silent = true })

-- Cut/paste to/from the system clipboard
vim.opt.clipboard:append({ 'unnamedplus' })

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
vim.o.completeopt = 'menuone,preview,noselect'

-- Python executables and environments
-- disable python2 support
vim.g.loaded_python_provider = 0
vim.g.python3_host_prog = '/home/nacnudus/.virtualenvs/neovim-python3/bin/python'

-- Spaces & Tabs
vim.o.tabstop     = 2    -- number of visual spaces per TAB
vim.o.softtabstop = 2    -- number of spaces in tab when editing
vim.o.shiftwidth  = 2    -- number of spaces to use for autoindent
vim.o.expandtab   = true -- tabs are spaces
vim.o.autoindent  = true
vim.o.copyindent  = true -- copy indent from the previous line

-- Visual cues
vim.o.number = true         -- Make line numbers default
vim.o.relativenumber = true -- Make line numbers relative
vim.o.cursorline = true     -- highlight the line under the curser
vim.o.virtualedit = 'all'   -- edit where there is no actual character
vim.o.conceallevel = 2      -- hidden unless a replacement character is defined
vim.o.showmatch = true      -- briefly jump to the matching bracket on insertion

-- Exit without save
vim.api.nvim_set_keymap('n', '``', ':qa!<CR>', { noremap = true, silent = true })

-- Save quickly
vim.api.nvim_set_keymap('n', '<Leader>w', ':update<CR>', { noremap = true, silent = true })

-- Session persistence
vim.opt.backupdir = '$HOME/.config/nvim/tmp/backup/'
vim.opt.shadafile = '$HOME/.config/nvim/tmp/viminfo'
vim.opt.undodir = '$HOME/.config/nvim/tmp/undo/'
vim.opt.directory = '$HOME/.config/nvim/tmp/swap/'
