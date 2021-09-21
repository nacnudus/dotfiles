local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
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
  -- Fancier statusline
  use { 'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true} }
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Lists of things
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
  use { 'nvim-telescope/telescope-symbols.nvim', requires = { { 'nvim-telescope/telescope.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  -- Language server
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Auto-completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "f3fora/cmp-spell",
      "quangnguyen30192/cmp-nvim-tags",
      "ray-x/cmp-treesitter",
      "kdheepak/cmp-latex-symbols",
    }
  }
  use 'onsails/lspkind-nvim' -- Add vscode-like pictograms to neovim built-in lsp
  --  Tim Pope
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-surround' -- Edit pairs of surrounding characters
  -- Languages
  use 'jalvesaq/nvim-r' -- R languauge plugin
end)

require('plugins.cheatsheet-nvim')
require('plugins.gitsigns')
require('plugins.lspkind-nvim')
require('plugins.lualine-nvim')
require('plugins.nvim-cmp')
require('plugins.nvim-r')
require('plugins.telescope')
require('plugins.vim-commentary')
