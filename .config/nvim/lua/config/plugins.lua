vim.api.nvim_exec(
  [[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
  augroup end
]] ,
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  use 'kdheepak/lazygit.nvim' -- Git gui
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use "tpope/vim-rails" -- add helpful rails commands
  use "vim-ruby/vim-ruby" -- expanded ruby support
  use "mxw/vim-jsx"

  use {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require('colorful-winsep').setup()
    end
  }
  use 'navarasu/onedark.nvim' -- Color scheme

  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use "itchyny/vim-cursorword" -- highlight word under cursor
  use "tpope/vim-repeat" -- Expand . repeat to work with more stuff
  use "tpope/vim-surround" -- shortcuts for surrounding objects
  use "kana/vim-textobj-user" -- dependency for tpope plugins
  use "nelstrom/vim-textobj-rubyblock" -- dependency for tpope plugins
  use "ggandor/lightspeed.nvim" -- fasf motion, improves f
  use 'RRethy/nvim-treesitter-textsubjects' -- tree sitter bock selection
  use "dhruvasagar/vim-zoom" -- zoom individual pane

  use 'christoomey/vim-tmux-navigator' -- dependency for tpope plugins
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use "folke/which-key.nvim" -- keymap viewer

  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use "williamboman/mason.nvim" -- lsp dependency manager
  use 'neovim/nvim-lspconfig' -- lsp configuration manager
  use 'nanotee/nvim-lsp-basics' -- extends basic lsp with user friendly commands
  use {
    'nvim-treesitter/nvim-treesitter', -- better syntax highlighting
    run = ':TSUpdate'
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0', -- fuzzy finder
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- lsp source for cmp
  use 'hrsh7th/cmp-buffer' -- buffer source for cmp
  use 'hrsh7th/cmp-path' -- path source for cmp
  use 'saadparwaiz1/cmp_luasnip' -- luasnip source for cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'rafamadriz/friendly-snippets' -- default snippets

  use {
    "nvim-neotest/neotest", -- test runner
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'olimorris/neotest-rspec',
    }
  }
  use "vim-test/vim-test" -- legacy test runner
  use "preservim/vimux" -- run legacy tests in tmux

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use { 'vimpostor/vim-tpipeline' } -- push statusline to tmux?
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    "startup-nvim/startup.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require "startup".setup()
    end
  }

  use {
    "mickael-menu/zk-nvim",
    requires = { "neovim/nvim-lspconfig" }
  }
  use {
    'sudormrfbin/cheatsheet.nvim',

    requires = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    }
  }
 use 'ggandor/leap.nvim'
end
)
