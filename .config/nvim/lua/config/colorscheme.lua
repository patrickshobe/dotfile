vim.o.termguicolors = true

require('onedark').setup {
  style = 'deep',
  transparent = true
}
require('onedark').load()

-- transparent background for barbar
vim.cmd([[
  hi! BufferTabpageFill ctermbg=red 
  hi! CursorLine gui=underline cterm=underline
]])


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

return custom_codedark
