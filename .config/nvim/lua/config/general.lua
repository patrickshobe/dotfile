require("nvim-tree").setup({view = {side = 'right'}})
require("mason").setup()
vim.g.gutentags_cache_dir = '~/.tags'

local custom_codedark = require('lualine.themes.codedark')
custom_codedark.normal.b.bg = '#282c34'
custom_codedark.normal.c.bg = '#282c34'
custom_codedark.visual.b.bg = '#282c34'
custom_codedark.visual.a.bg = '#282c34'
custom_codedark.inactive.b.bg = '#282c34'
custom_codedark.inactive.a.bg = '#282c34'
custom_codedark.replace.b.bg = '#282c34'
custom_codedark.replace.c.bg = '#282c34'
custom_codedark.insert.b.bg = '#282c34'
custom_codedark.insert.c.bg = '#282c34'

require('lualine').setup {
  options = { theme  = custom_codedark, globalstatus = true  }
}
require("startup").setup({theme = "dashboard"})
