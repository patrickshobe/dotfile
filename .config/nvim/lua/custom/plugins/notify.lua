return {
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        background_colour = '#000000',
      }
    end,
  },
  {
    'mrded/nvim-lsp-notify',
    event = 'VeryLazy',
    config = function()
      require('lsp-notify').setup {
        notify = require 'notify',
      }
    end,
  },
}
