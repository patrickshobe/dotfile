local wk = require("which-key")
wk.setup {}
wk.register({
  s = {
    name = "Search",
    F = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find File" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Buffers" },
    r = { "<cmd>lua require('telescope.builtin').resume()<CR>", "Resume" },
    f = { "<cmd>lua require('telescope.builtin').git_files()<CR>", "Find Git Files" },
    g = { "<cmd>lua require('telescope.builtin').git_status()<CR>", "Git Status" },
    h = { "<cmd>lua require('telescope.builtin').history()<CR>", "History" },
    ib = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", "Current Buffer Fuzzy Find" },
    o = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", "Old files" },
    sh = { "<cmd>lua require('telescope.builtin').search_history()<CR>", "History" },
    t = { "<cmd>lua require('telescope.builtin').tags()<CR>", "Tags" },
  },
  b = {
    name = "Buffer",
    D = { "<cmd>BufferPickDelete<CR>", "Pick Delete" },
    d = { "<cmd>BufferClose<CR>", "Close" },
    j = { "<cmd>BufferPick<CR>", "Pick" },
    l = { "<cmd>BufferLast<CR>", "Last" },
    n = { "<cmd>BufferNext<CR>", "Next" },
    p = { "<cmd>BufferPrevious<CR>", "Previous" },
    r = { "<cmd>BufferRestore<CR>", "Restore" },
    s = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Search" },
  },
  n = {
    name = "Notes",
    t = { "<cmd>ObsidianToday<CR>", "Today" },
    y = { "<cmd>ObsidianYesterday<CR>", "Today" },
    f = { "<cmd>ObsidianQuickSwitch<CR>", "Find File" },
    s = { "<cmd>ObsidianSearch<CR>", "Search" },
    n = { "<cmd>ObsidianNew<CR>", "New" },
  },
  t = {
    name = "test",
    a = { "<cmd>lua require('neotest').run.attach()<cr>", "attach" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "file" },
    l = { "<cmd>lua require('neotest').run.last()<cr>", "last" },
    n = { "<cmd>lua require('neotest').run.run()<cr>", "nearest" },
    s = { "<cmd>lua require('neotest').run.stop()<cr>", "stop" },
    p = { "<cmd>lua require('neotest').output_panel.toggle()<cr>", "output panel" },
    y = { "<cmd>lua require('neotest').summary.toggle()<cr>", "summary" },
    Y = { "<cmd>lua require('neotest').summary.toggle(vim.fn.expand('%'))<cr>", "summary this" },
    o = { "<cmd>lua require('neotest').output.open()<cr>", "output" },
    F = { "<cmd>TestFile<cr>", "file" },
    N = { "<cmd>TestNearest<cr>", "nearest" },
    L = { "<cmd>TestLast<cr>", "last" },
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
    name = "Tree",
    F = { "<cmd>Neotree float toggle<CR>", "Float" },
    fb = { "<cmd>Neotree float toggle buffers<CR>", "Float Buffers" },
    fg = { "<cmd>Neotree float toggle git_status<CR>", "Float Git Status" },
    fs = { "<cmd>Neotree float toggle git_status<CR>", "Float Document Symbols" },
    S = { "<cmd>Neotree<CR>", "Show" },
    sb = { "<cmd>Neotree buffers<CR>", "Buffers" },
    sg = { "<cmd>Neotree git_status<CR>", "Git Status" },
    ss = { "<cmd>Neotree git_status<CR>", "Document Symbols" },
    t = { "<cmd>Neotree toggle<CR>", "Toggle" },
  },
  h = {
    name = "harpoon",
    a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add" },
    q = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Quick Menu" },
    n = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next File" },
    l = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous File" },
    s = { "<cmd>Telescope harpoon marks<CR>", "Search Marks" },
  },
  ["<space>"] = { "<cmd>Telescope<CR>", "Telescope" },
  c = { "<cmd>Telescope commands<CR>", "Commands" },
  C = { "<cmd>VimuxRunCommand ", "Run in Vimux"}


}, { prefix = "<leader>" })

vim.keymap.set('n', 'cn', '*``cgn')
vim.keymap.set('n', 'cN', '*``cgN')
