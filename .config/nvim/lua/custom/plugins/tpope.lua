return {
  { 'kana/vim-textobj-user', lazy = false, priority = 1000 },
  { 'nelstrom/vim-textobj-rubyblock' },
  {
    "tpope/vim-rails",
    config = function()
      vim.api.nvim_create_user_command(
        "AC",
        function() vim.cmd("e " .. vim.fn.eval "rails#buffer().alternate()") end,
        {}
      )
    end,
  },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },
  { 'vim-ruby/vim-ruby' },
}
