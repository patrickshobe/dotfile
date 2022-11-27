local neotest = require('neotest')
neotest.setup({
  adapters = {
    require('neotest-rspec')({
      rspec_cmd = function()
        return vim.tbl_flatten({
          "bundle",
          "exec",
          "rspec",
        })
      end
    }),
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "𐄂",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "✓",
    running = "",
    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
    skipped = "s",
    unknown = ""
  },
  status = {
    signs = false,
    virtual_text = true,
  },
  output = {
    enabled = true,
  },
  summary = {
    enabled = true,
    animated = true,
    follow = true,
  },
  diagnostics = {
    enabled = true,
  },
  output_panel = {
    enabled = true,
    open = "botright 10 split"
  },
  strategies = {
    integrated = {
    }
  },
})

-- Legacy testing for debugging in tmux
vim.cmd([[
  let test#strategy = "vimux"
  let test#ruby#rspec#options = '--format p'
]])

