return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)

      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        [[██████╗ ███████╗██████╗  ██████╗██╗  ██╗██╗    ██╗███████╗██╗     ██╗     ]],
        [[██╔══██╗██╔════╝██╔══██╗██╔════╝██║  ██║██║    ██║██╔════╝██║     ██║     ]],
        [[██████╔╝█████╗  ██████╔╝██║     ███████║██║ █╗ ██║█████╗  ██║     ██║     ]],
        [[██╔═══╝ ██╔══╝  ██╔══██╗██║     ██╔══██║██║███╗██║██╔══╝  ██║     ██║     ]],
        [[██║     ███████╗██║  ██║╚██████╗██║  ██║╚███╔███╔╝███████╗███████╗███████╗]],
        [[╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝╚══════╝]],
      }
      dashboard.section.header.opts.hl = {}

      dashboard.section.buttons.val = {
        dashboard.button('e', '  > New file', ':ene <BAR> startinsert <CR>'),
        dashboard.button('f', '  > Find file', '<cmd>Telescope find_files<CR>'),
        dashboard.button('s', '  > Search In Files', '<cmd>Telescope live_grep<cr>'),
        dashboard.button('r', '  > Recent', '<cmd>Telescope oldfiles<CR>'),
        dashboard.button('L', '  > Manage plugins', '<cmd>Lazy<CR>'),
        dashboard.button('s', '  > Settings', ':e $MYVIMRC | :cd %:p:h | vsplit . | wincmd k | pwd<CR>'),
        dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
      }
    end,
  },
}
