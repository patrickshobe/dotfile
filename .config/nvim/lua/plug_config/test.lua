vim.cmd([[
  let test#strategy = "vimux"
  let test#ruby#rspec#options = '--format p'
]])


require("neotest").setup({
  adapters = {
    require("neotest-rspec"),
  },
  floating = {
    border = "rounded",
    max_height = 0.8,
    max_width = 0.8,
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "▱",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "○",
    running = "⋯",
    running_animated = { "◜", "◝", "◞", "◟", "◠", "◡", "◯" },
    skipped = "⟲",
    unknown = "",
    watching = "⌕"
  },
  output = {
    open_on_run = true
  },
  quickfix = {
    open = false
  },
})

-- Disable test results from being virtual text
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = false,
}, neotest_ns)
