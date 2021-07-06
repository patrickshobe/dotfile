O.format_on_save = false
O.auto_close_tree = 0
O.wrap_lines = false
vim.g.onedark_style = 'darker'
O.colorscheme = 'onedark'
O.timeoutlen = 100
O.document_highlight = true
O.leader_key = " "
O.ignore_case = true
O.smart_case = true
O.lushmode = false
O.transparent_window = false

-- TODO User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
O.plugin.hop.active = false
O.plugin.dial.active = false
O.plugin.dashboard.active = true
O.plugin.matchup.active = false
O.plugin.colorizer.active = false
O.plugin.numb.active = false
O.plugin.ts_playground.active = false
O.plugin.indent_line.active = false
O.plugin.gitlinker.active = true
O.plugin.zen.active = false
O.plugin.lazygit.active = true
O.plugin.diffview.active = true
O.plugin.ranger.active = true
O.custom_plugins = {{"vim-ruby/vim-ruby"}, 
    {"tpope/vim-rails"},
    {"kana/vim-textobj-user"},
    {"nelstrom/vim-textobj-rubyblock"},
    {"itchyny/vim-cursorword"},
    {"vim-test/vim-test"},
    {"ludovicchabant/vim-gutentags"},
    {"christoomey/vim-tmux-navigator"},
    {"navarasu/onedark.nvim"},
    {"mxw/vim-jsx"},
    {"tpope/vim-endwise"},
    {"preservim/vimux"},
    {"junegunn/fzf"},
    {"junegunn/fzf.vim"},
    {"pwntester/octo.nvim"},
    }

-- dashboard
-- O.dashboard.custom_header = {""}
-- O.dashboard.footer = {""}

-- if you don't want all the parsers change this to a table of the ones you want
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true

O.lang.clang.diagnostics.virtual_text = true
O.lang.clang.diagnostics.signs = true
O.lang.clang.diagnostics.underline = true

-- python
-- add things like O.python.linter.flake8.exec_path
-- O.python.linter = 'flake8'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.diagnostics.signs = true
O.lang.python.diagnostics.underline = true
O.lang.python.analysis.type_checking = "off"
O.lang.python.analysis.auto_search_paths = true
O.lang.python.analysis.use_library_code_types = true

-- javascript
O.lang.tsserver.linter = nil

-- php
O.lang.php.environment.php_version = "7.4"
O.lang.php.diagnostics.signs = true
O.lang.php.diagnostics.underline = true
O.lang.php.filetypes = {"php", "phtml"}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- O.user_autocommands = {{ "BufWinEnter", "*", "echo \"hi again\""}}

-- Additional Plugins
-- O.custom_plugins = {{"windwp/nvim-ts-autotag"}}

vim.cmd([[
set undodir=~/.vim/undo-dir
set undofile
let test#strategy = "vimux"
let test#ruby#rspec#options = '--drb --format p'
set scrolloff=999
]])
