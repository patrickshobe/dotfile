require("nvim-tree").setup({view = {side = 'right'}})
require("mason").setup()
vim.g.gutentags_cache_dir = '~/.tags'

require('lualine').setup {
  options = { theme  = 'onedark' }
}
require("startup").setup({theme = "dashboard"})
