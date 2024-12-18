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

-- Language executables and environments
-- Disable by setting = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Disable
-- vim.g.python3_host_prog = '/home/nacnudus/.virtualenvs/neovim-python3/bin/python'

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
vim.o.title = true          -- show the filename and full path in the window title bar
vim.o.scrolloff = 7 -- buffer when scrolling

-- Exit without save
vim.api.nvim_set_keymap('n', '``', ':qa!<CR>', { noremap = true, silent = true })

-- Save quickly
vim.api.nvim_set_keymap('n', '<Leader>ww', ':update<CR>', { noremap = true, silent = true })

-- Session persistence
vim.opt.backupdir = vim.fn.expand('~/.config/nvim/tmp/backup/')
vim.opt.shadafile = vim.fn.expand('~/.config/nvim/tmp/viminfo')
vim.opt.undodir = vim.fn.expand('~/.config/nvim/tmp/undo/')
vim.opt.directory = vim.fn.expand('~/.config/nvim/tmp/swap/')

-- Switch between windows
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

-- New panes
vim.api.nvim_set_keymap('n', '<Leader>v', '<C-w>v', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>s', { noremap = true, silent = true })

-- Copy buffer file path to clipboard
vim.api.nvim_create_user_command('Path', ":let @+=expand('%')", {})
vim.api.nvim_create_user_command('FullPath', ":let @+=expand('%:p')", {})

-- Fast window & buffer close and kill.
-- from http://stackoverflow.com/a/4468491/937932, close buffer without closing
-- window.
vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w><C-c>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>K', ':bp|bd #<CR>', { noremap = true, silent = true })

-- Manage sessions
vim.o.sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"

-- Mark the final column
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"

-- Don't hard-wrap markdown (because GitHub doesn't render it properly)
vim.cmd('autocmd FileType markdown set textwidth=9999')

-- Format a json buffer with jq
vim.api.nvim_set_keymap('n', '<Leader>jq', ':%!jq .<CR>', { noremap = true, silent = true })

-- Stringify a json buffer with jq
vim.api.nvim_set_keymap('n', '<Leader>js', ':%!jq \'. | @json\'<CR>', { noremap = true, silent = true })
--
-- Format a json buffer into yaml
vim.api.nvim_set_keymap('n', '<Leader>yq', ':%!yq -P .<CR>', { noremap = true, silent = true })
