local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  -- cope with big files
  use {
    "LunarVim/bigfile.nvim",
  }
  -- Cheatsheet
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
  -- Colour scheme with treesitter support. Check for better-maintained alternatives.
  use { "sainnhe/gruvbox-material" }
  use "mikker/vim-togglebg" -- toggle light/dark theme
  -- Fancier statusline
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  -- Edit a filesystem like a normal buffer
  use { 'stevearc/oil.nvim', config=function() require("oil").setup() end }
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- GitHub integration
  use { 'pwntester/octo.nvim', config=function() require"octo".setup() end }
  -- Lists of things
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-symbols.nvim', requires = { { 'nvim-telescope/telescope.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' } -- support exact matches and other syntax
  use { 'nvim-telescope/telescope-media-files.nvim' } -- media_files to view thumbnails
  -- Snippets, mainly because they're required for the html language server
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  -- Language server
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'kosayoda/nvim-lightbulb' -- Show lightbulb in gutter when codeactions available
  use {
    "folke/trouble.nvim", -- pretty diagnostics, quickfix, location, references, telescope
    requires = "kyazdani42/nvim-web-devicons",
    config = function() require("trouble").setup{} end
  }
  -- Debug adapter protocol (DAP)
  use 'mfussenegger/nvim-dap'
  use { 'mfussenegger/nvim-dap-python' }
  use { "rcarriga/nvim-dap-ui", requires = { { 'nvim-neotest/nvim-nio'} } }
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'p00f/nvim-ts-rainbow' -- parentheses matching
  use {
    "code-biscuits/nvim-biscuits",
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use {
    'romgrk/nvim-treesitter-context',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  -- Auto-completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "f3fora/cmp-spell",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/nvim-lspconfig",
      "kdheepak/cmp-latex-symbols",
      "petertriho/cmp-git",
      "quangnguyen30192/cmp-nvim-tags",
      "ray-x/cmp-treesitter",
      "jalvesaq/cmp-nvim-r",
    }
  }
  -- GitHub Copilot
  use {
    -- "github/copilot.vim",
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- Resolve conflict with copilot-cmp
        -- suggestion = { enabled = false },
        -- panel = { enabled = false },
      })
    end,
  }
  use {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  }
  --  Tim Pope
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use { 'tpope/vim-surround', requires = { 'tpope/vim-repeat' } } -- Edit pairs of surrounding characters
  use 'tpope/vim-characterize' -- Reveal character info, unicode included
  use { 'tpope/vim-speeddating', requires = { 'tpope/vim-repeat' } } -- Increment dates
  use { 'tpope/vim-unimpaired', requires = { 'tpope/vim-repeat' } } -- pairwise utilities
  use 'tpope/vim-eunuch' -- help for UNIX e.g. :Remove :SudoWrite :Move :Rename etc.
  -- Send code to a REPL
  use { 'jalvesaq/vimcmdline', ft = { 'python', 'julia' } }
  -- Languages
  use { 'jalvesaq/Nvim-R', ft = { 'quarto', 'r', 'rmd', 'rrst', 'rout' } } -- R language plugin
  use { 'memgraph/cypher.vim', ft = { 'cypher' } }
  -- Clipboard
  use { "AckslD/nvim-neoclip.lua", requires = { 'tami5/sqlite.lua', module = 'sqlite' } }
  use "mbbill/undotree" -- Undo tree
  use "farmergreg/vim-lastplace" -- Reopen files in the place the cursor was last time
  use "dahu/vim-fanfingtastic" -- f character across lines
  use "rmagatti/auto-session" -- automatically save and load sessions
  use {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({--[[your custom config--]]})
    end
  }
  use {
    'AckslD/nvim-revJ.lua', -- un-join function signatures
    requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'},
  }
  use "folke/twilight.nvim" -- dim inactive sections of code
  use "nacro90/numb.nvim" -- peek at line numbers
  use "kshenoy/vim-signature" -- display marks beside line numbers
  use "jeffkreeftmeijer/vim-numbertoggle" -- toggle between absolute and relative
  use "PeterRincker/vim-argumentative" -- swap function arguments
  use "troydm/zoomwintab.vim" -- maximise a window temporarily
  use "ntpeters/vim-better-whitespace" -- trim whitespace on save
  use {
    'abecodes/tabout.nvim', -- tab out of parentheses
    require = {'nvim-treesitter'}, -- or require if not used so far
    after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
  }
  use "RRethy/vim-illuminate" -- highlight other instances of the word under the cursor
  use "kyazdani42/nvim-web-devicons" -- add icons to plugins
  use { "gelguy/wilder.nvim", -- wildmenu autocomplete
    requires = { 'romgrk/fzy-lua-native', after = 'wilder.nvim' }
  }
  use "coachshea/vim-textobj-markdown" -- text objects of code fences and headings
  -- git diff
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'AndrewRadev/linediff.vim' }
  use { 'drybalka/tree-climber.nvim' }
end)

require('plugins.bigfile_nvim')
require('plugins.gruvbox-material')
require('plugins.cheatsheet-nvim')
require('plugins.gitsigns')
require('plugins.lualine-nvim')
require('plugins.nvim-cmp')
require('plugins.nvim-r')
require('plugins.telescope')
require('plugins.vimcmdline')
require('plugins.vim-commentary')
require('plugins.nvim-neoclip')
require('plugins.undotree')
require('plugins.vim-togglebg')
require('plugins.vim-fugitive')
require('plugins.nvim-lightbulb')
require('plugins.nvim-revJ')
require('plugins.twilight_nvim')
require('plugins.nvim-treesitter-context')
require('plugins.numb_nvim')
require('plugins.zoomwintab_vim')
require('plugins.vim-better-whitespace')
require('plugins.tabout_nvim')
require('plugins.vim-illuminate')
require('plugins.wilder_nvim')
require('plugins.nvim-web-devicons')
require('plugins.nvim-biscuits')
require('plugins.diffview_nvim')
require("plugins.cmp-git")
require('plugins.tree-climber_nvim')
require('plugins.vsnip')
require('plugins.oil_nvim')
