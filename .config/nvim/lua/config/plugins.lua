vim.api.nvim_exec(
  [[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  use 'kdheepak/lazygit.nvim' -- Git gui
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  use "tpope/vim-rails" -- add helpful rails commands
  use "vim-ruby/vim-ruby" -- expanded ruby support
  use "mxw/vim-jsx"

  use 'navarasu/onedark.nvim' -- Color scheme
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use "itchyny/vim-cursorword" -- highlight word under cursor
  use "tpope/vim-repeat" -- Expand . repeat to work with more stuff
  use "tpope/vim-surround" -- shortcuts for surrounding objects
  use "kana/vim-textobj-user" -- dependency for tpope plugins
  use "nelstrom/vim-textobj-rubyblock"-- dependency for tpope plugins
  use "ggandor/lightspeed.nvim"
  use 'RRethy/nvim-treesitter-textsubjects'

  use 'christoomey/vim-tmux-navigator'-- dependency for tpope plugins
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use "folke/which-key.nvim"

  use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  use "williamboman/mason.nvim"
  use 'neovim/nvim-lspconfig'
  use 'nanotee/nvim-lsp-basics'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'rafamadriz/friendly-snippets'



  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      'olimorris/neotest-rspec',
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {'vimpostor/vim-tpipeline'} -- push statusline to tmux?
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {
    "mickael-menu/zk-nvim",
    requires = { "neovim/nvim-lspconfig" }
  }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  }use {
    "nvim-zh/colorful-winsep.nvim",
    config = function ()
      require('colorful-winsep').setup()
    end
  }
end
)
