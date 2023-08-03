require("mason").setup()

local colorscheme = require('plug_config.colorscheme')

require('lualine').setup {
  options = {
    theme = colorscheme.custom_codedark,
    globalstatus = true,
  }
}
require("oil").setup()

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
    file_ignore_patterns = {"%.rbi$"}
  },
}

require("telescope").load_extension('harpoon')
