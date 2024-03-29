local wk = require("which-key")
wk.setup {}
wk.register({
  s = {
    name = "Search",
    F = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
    f = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Find Git Files" },
    g = { "<cmd>lua require('telescope.builtin').git_status()<CR>", "Git Status" },
    sh = { "<cmd>lua require('telescope.builtin').search_history()<CR>", "History" },
    ib = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Current Buffer Fuzzy Find" },
    h = { "<cmd>lua require('telescope.builtin').history()<CR>", "History" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Old files" },
    t = { "<cmd>lua require('telescope.builtin').tags()<CR>", "Tags" },
  },
  b = {
    name = "Buffer",
    d = { "<cmd>BufferClose<CR>", "Close" },
    j = { "<cmd>BufferPick<CR>", "Pick" },
    l = { "<cmd>BufferLast<CR>", "Pick" },
    n = { "<cmd>BufferMoveNext<CR>", "Next" },
    p = { "<cmd>BufferPrevious<CR>", "Previous" },
    s = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Search" },
  },
  t = {
    name = "test",
    a = { "<cmd>lua require('neotest').run.attach()<cr>", "attach" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "file" },
    l = { "<cmd>lua require('neotest').run.last<cr>", "last" },
    n = { "<cmd>lua require('neotest').run.run()<cr>", "nearest" },
    s = { "<cmd>lua require('neotest').run.stop()<cr>", "stop" },
    p = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "output panel" },
    y = { "<cmd>lua require('neotest').summary.toggle()<cr>", "summary" },
    Y = { "<cmd>lua require('neotest').summary.toggle(vim.fn.expand('%'))<cr>", "summary this" },
    o = { "<cmd>lua require('neotest').output.open()<cr>", "output" },
    zf = { "<cmd>TestFile<cr>", "file" },
    zn = { "<cmd>TestNearest<cr>", "nearest" },
    zl = { "<cmd>TestLast<cr>", "last" },
  },
  l = {
    name = "lsp",
    D = { "<cmd>LspDeclaration<CR>", "Declaration" },
    d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
    f = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format" },
    h = { "<cmd>LspHover<CR>", "Hover" },
    r = { "<cmd>Telescope lsp_references<CR>", "References" },
    s = { "<cmd>LspSignatureHelp<CR>", "Signature Help" },
  },
  f = {
    name = "files",
    c = { "<cmd>NvimTreeCollapse<CR>", "Collapse" },
    f = { "<cmd>NvimTreeFindFile<CR>", "Find File" },
    t = { "<cmd>NvimTreeToggle<CR>", "Toggle" },
  },
  ["<space>"] = { "<cmd>Telescope<CR>", "Telescope" },
  c = { "<cmd>Telescope commands<CR>", "Commands" },


}, { prefix = "<leader>" })
