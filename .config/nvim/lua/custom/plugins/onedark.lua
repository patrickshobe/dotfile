return {
  {
    'navarasu/onedark.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('onedark').setup {
        style = 'deep',
        transparent = true,
      }
      -- Load the colorscheme here
      vim.cmd.colorscheme 'onedark'

      vim.cmd('highlight clear SpellBad')
      vim.cmd('highlight SpellBad term=underline ctermfg=1 term=underline ctermbg=NONE')
    end,
  },
}
