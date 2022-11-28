require("nvim-tree").setup({ view = { side = 'right' } })
require("mason").setup()
vim.g.gutentags_cache_dir = '~/.tags'
vim.opt.cursorline = true

local colorscheme = require('config.colorscheme')

require('lualine').setup {
  options = { theme = colorscheme.custom_codedark, globalstatus = true }
}
require("startup").setup({ theme = "dashboard" })
