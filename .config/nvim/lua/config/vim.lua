-- Highlight on yank
vim.cmd[[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({timeout=400})
augroup END
]]

vim.cmd([[
  set mouse=""
  set undodir=~/.vim/undo-dir
  set undofile
  set cursorline

  let test#strategy = "vimux"
  let test#ruby#rspec#options = '--format p'
  let g:ultest_deprecation_notice = 0

  set scrolloff=999
  set number relativenumber 
  set clipboard=unnamed 
  set noshowmode
]])
vim.cmd([[
  filetype plugin indent on
  " On pressing tab, insert 2 spaces
  set expandtab
  " show existing tab with 2 spaces width
  set tabstop=2
  set softtabstop=2
  " when indenting with '>', use 2 spaces width
  set shiftwidth=2
]])

vim.o.hlsearch = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true
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

-- disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

