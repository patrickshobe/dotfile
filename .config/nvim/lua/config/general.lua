require("nvim-tree").setup({ view = { side = 'right' } })
require("mason").setup()
vim.g.gutentags_cache_dir = '~/.tags'
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'screenline'


local colorscheme = require('config.colorscheme')

require('lualine').setup {
  options = { theme = colorscheme.custom_codedark, globalstatus = true }
}

require("obsidian").setup({
  dir = "~/vault/",
  daily_notes = {
    folder = "main/dailies",
  }
})

local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}
