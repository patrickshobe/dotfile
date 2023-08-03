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

-- TMUX
  use 'christoomey/vim-tmux-navigator' -- vim + tmux navigation
  use 'tpope/vim-dispatch'
  use ({
    'nvimdev/lspsaga.nvim',
    after = 'nvim-lspconfig',
    config = function()
        require('lspsaga').setup({})
    end,
})

  use { "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      })
  end}
use {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function ()
    require("copilot_cmp").setup()
  end
}
  use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }

-- FILE SYSTEM
  use {
  "nvim-neo-tree/neo-tree.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use {
    'stevearc/oil.nvim',
  }
  use { 'mg979/vim-visual-multi' }

  use "folke/which-key.nvim" -- keymap viewer

  -- VISUAL
  use 'navarasu/onedark.nvim' -- Color scheme
  use "itchyny/vim-cursorword" -- highlight word under cursor

  use {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require('colorful-winsep').setup()
    end
  }

  use { 'vimpostor/vim-tpipeline' } -- push statusline to tmux?

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- GIT
  
   use 'kdheepak/lazygit.nvim' -- Git gui
   use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
   use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- TPOPE
  use "kana/vim-textobj-user" -- dependency for tpope plugins
  use "nelstrom/vim-textobj-rubyblock" -- dependency for tpope plugins
  use "tpope/vim-rails" -- add helpful rails commands
  use "tpope/vim-repeat" -- Expand . repeat to work with more stuff
  use "tpope/vim-surround" -- shortcuts for surrounding objects
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0', -- fuzzy finder
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup { }
    end
  }

  use  { 'Raimondi/delimitMate' }

  use 'epwalsh/obsidian.nvim'

  use "dhruvasagar/vim-zoom" -- zoom individual pane

  -- LANGUAGE SUPPORT
  use "vim-ruby/vim-ruby" -- expanded ruby support

  -- Movement
  use 'ThePrimeagen/harpoon'
  use 'ggandor/leap.nvim' -- Search like f but with s
  use "ggandor/lightspeed.nvim" -- fasf motion, improves f

  use {
    'nvim-treesitter/nvim-treesitter', -- better syntax highlighting
  }


  -- LSP
  use "williamboman/mason.nvim" -- lsp dependency manager
  use 'mfussenegger/nvim-lint' -- Linting
  use 'neovim/nvim-lspconfig' -- lsp configuration manager
  use 'nanotee/nvim-lsp-basics' -- extends basic lsp with user friendly commands

  use 'RRethy/nvim-treesitter-textsubjects' -- tree sitter bock selection
  use 'ludovicchabant/vim-gutentags' -- Automatic tags management

  -- Completion
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- lsp source for cmp
  use 'hrsh7th/cmp-buffer' -- buffer source for cmp
  use 'hrsh7th/cmp-path' -- path source for cmp

  -- Snippets
  use 'saadparwaiz1/cmp_luasnip' -- luasnip source for cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'rafamadriz/friendly-snippets' -- default snippets

  -- Tests
  use "vim-test/vim-test" -- legacy test runner
  use "preservim/vimux" -- run legacy tests in tmux
  use {
  "nvim-neotest/neotest",
  requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    'olimorris/neotest-rspec',
  }
}
end
)
