-- NOTE: Plugins can also be configured to run lua code when they are loaded.
--
-- This is often very useful to both group configuration, as well as handle
-- lazy loading plugins that don't need to be loaded immediately at startup.
--
-- For example, in the following configuration, we use:
--  event = 'VeryLazy'
--
-- which loads which-key after all the UI elements are loaded. Events can be
-- normal autocommands events (:help autocomd-events).
--
-- Then, because we use the `config` key, the configuration only runs
-- after the plugin has been loaded:
--  config = function() ... end

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
    config = function() -- This is the function that runs, AFTER loading
      -- require('which-key').setup()
      --
      -- -- Document existing key chains
      -- require('which-key').register({
      --   f = { "<cmd>lua require('ranger-nvim').open(true)<CR>", 'File' },
      --   z = { "<cmd>ZenMode<CR>", 'Zen' },
      --   F = { "<cmd>lua require('ranger-nvim').open(false)<CR>", 'File Root' },
      --   N = { '<cmd>Notifications<CR>', 'Notifications' },
      --   cp = { '<cmd>Copilot panel<CR>', 'Copilot' },
      --   u = { '<cmd>lua require("telescope").extensions.undo.undo()<CR>', 'Undo' },
      --   n = {
      --     name = 'Notes',
      --     t = { '<cmd>ObsidianToday<CR>', 'Today' },
      --     s = { '<cmd>ObsidianSearch<CR>', 'Search' },
      --     y = { '<cmd>ObsidianYesterday<CR>', 'Search' },
      --   },
      --   g = {
      --     name = 'Git',
      --     b = { '<cmd>GBrowse<CR>', 'Browse' },
      --     g = { '<cmd>LazyGit<CR>', 'Lazy' },
      --     l = { '<cmd>LazyGitFilter<CR>', 'Log' },
      --   },
      --   b = {
      --     name = 'Buffers',
      --     d = { '<cmd>BufferDelete<CR>', 'Delete' },
      --     D = { '<cmd>BufferPickDelete<CR>', 'Pick Delete' },
      --     j = { '<cmd>BufferPrevious<CR>', 'Previous' },
      --     k = { '<cmd>BufferNext<CR>', 'Next' },
      --     p = { '<cmd>BufferPick<CR>', 'Pick' },
      --     q = { '<cmd>BufferCloseAllButPinned<CR>', 'Clear' },
      --   },
      --   s = {
      --     name = 'Search',
      --     F = { "<cmd>lua require('telescope.builtin').git_files()<CR>", 'Find File' },
      --     f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'Find Git Files' },
      --     g = { "<cmd>lua require('telescope.builtin').git_status()<CR>", 'Git Status' },
      --     sh = { "<cmd>lua require('telescope.builtin').search_history()<CR>", 'History' },
      --     ib = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", 'Current Buffer Fuzzy Find' },
      --     h = { "<cmd>lua require('telescope.builtin').history()<CR>", 'History' },
      --     o = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", 'Old files' },
      --     t = { "<cmd>lua require('telescope.builtin').tags()<CR>", 'Tags' },
      --     w = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", 'Word under cursor' },
      --   },
      --   t = {
      --     name = 'Test',
      --     tf = { '<cmd>TestFile<CR>', '[t]mux File' },
      --     f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", 'File' },
      --     tl = { '<cmd>TestLast<CR>', '[t]mux Last' },
      --     l = { "<cmd>lua require('neotest').run.run_last()<CR>", 'Last' },
      --     tn = { '<cmd>TestNearest<CR>', '[t]mux Nearest' },
      --     n = { "<cmd>lua require('neotest').run.run()<CR>", 'Nearest' },
      --     oo = { "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>", 'Output Open' },
      --     ot = { "<cmd>lua require('neotest').output.toggle()<CR>", 'Output toggle' },
      --     op = { "<cmd>lua require('neotest').output_panel.toggle()<CR>", 'Output Panel Toggle' },
      --     s = { "<cmd>lua require('neotest').summary.toggle()<CR>", 'Summary' },
      --   },
      --   d = {
      --     name = 'Diagnostics',
      --     o = { '<cmd>lua require("trouble").toggle()<CR>', 'toggle' },
      --     w = { '<cmd>lua require("trouble").toggle("workspace_diagnostics")<CR>', 'Workspace Diagnostics' },
      --     d = { '<cmd>lua require("trouble").toggle("document_diagnostics")<CR>', 'Document Diagnostics' },
      --     q = { '<cmd>lua require("trouble").toggle("quickfix")<CR>', 'Quickfix' },
      --     l = { '<cmd>lua require("trouble").toggle("loclist")<CR>', 'Quickfix' },
      --     r = { '<cmd>lua require("trouble").toggle("lsp_references")<CR>', 'References' },
      --     t = { '<cmd>lua require("trouble").toggle("neotest")<CR>', 'References' },
      --   },
      --   l = {
      --     name = 'Lsp',
      --     d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'Definitions' },
      --     D = { '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', 'Type Definitions' },
      --     r = { '<cmd>lua require("telescope.builtin").lsp_references()<CR>', 'References' },
      --     i = { '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', 'Implementations' },
      --     sd = { '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', 'Symbols Document' },
      --     sw = { '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', 'Symbols Workspace' },
      --     R = { '<cmd>Lspsaga rename<CR>', 'Rename' },
      --     a = { '<cmd>Lspsaga code_action<CR>', 'Action' },
      --     h = { '<cmd>Lspsaga hover<CR>', 'Hover' },
      --     o = { '<cmd>Lspsaga outline<CR>', 'Outline' },
      --     pr = { '<cmd>Lspsaga project_replace<CR>', 'Project Replace' },
      --     e = { '<cmd>Lspsaga peek_definition<CR>', 'Peek Definition' },
      --     f = { '<cmd>lua vim.lsp.buf.format()<CR>', 'format' },
      --   },
      -- }, { prefix = '<leader>' })
      --
local which_key = require("which-key")


which_key.add({
    { "<leader>F", "<cmd>lua require('ranger-nvim').open(false)<CR>", desc = "File Root" },
    { "<leader>N", "<cmd>Notifications<CR>", desc = "Notifications" },

    { "<leader>b", group = "Buffers" },
    { "<leader>bD", "<cmd>BufferPickDelete<CR>", desc = "Pick Delete" },
    { "<leader>bd", "<cmd>BufferDelete<CR>", desc = "Delete" },
    { "<leader>bj", "<cmd>BufferPrevious<CR>", desc = "Previous" },
    { "<leader>bk", "<cmd>BufferNext<CR>", desc = "Next" },
    { "<leader>bp", "<cmd>BufferPick<CR>", desc = "Pick" },
    { "<leader>bq", "<cmd>BufferCloseAllButPinned<CR>", desc = "Clear" },

    { "<leader>c", group = "Chat" },
    { "<leader>ca", '<cmd>CodeCompanionActions<CR>', desc = "Actions" },
    { "<leader>cc", '<cmd>CodeCompanionChat<CR>', desc = "Chat" },
    { "<leader>ct", '<cmd>CodeCompanionToggle<CR>', desc = "Toggle" },
    { "<leader>ca", '<cmd>CodeCompanionAdd<CR>', desc = "Add currently selected text to chat buffer", mode='v' },

    { "<leader>d", group = "Diagnostics" },
    { "<leader>dd", '<cmd>lua require("trouble").toggle("document_diagnostics")<CR>', desc = "Document Diagnostics" },
    { "<leader>dl", '<cmd>lua require("trouble").toggle("loclist")<CR>', desc = "Quickfix" },
    { "<leader>do", '<cmd>lua require("trouble").toggle()<CR>', desc = "toggle" },
    { "<leader>dq", '<cmd>lua require("trouble").toggle("quickfix")<CR>', desc = "Quickfix" },
    { "<leader>dr", '<cmd>lua require("trouble").toggle("lsp_references")<CR>', desc = "References" },
    { "<leader>dw", '<cmd>lua require("trouble").toggle("workspace_diagnostics")<CR>', desc = "Workspace Diagnostics" },

    { "<leader>f", "<cmd>lua require('ranger-nvim').open(true)<CR>", desc = "File" },

    { "<leader>g", group = "Git" },
    { "<leader>gb", "<cmd>GBrowse<CR>", desc = "Browse" },
    { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Lazy" },
    { "<leader>gl", "<cmd>LazyGitFilter<CR>", desc = "Log" },

    { "<leader>l", group = "Lsp" },
    { "<leader>lD", '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', desc = "Type Definitions" },
    { "<leader>lR", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
    { "<leader>la", "<cmd>Lspsaga code_action<CR>", desc = "Action" },
    { "<leader>ld", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', desc = "Definitions" },
    { "<leader>le", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "format" },
    { "<leader>lh", "<cmd>Lspsaga hover<CR>", desc = "Hover" },
    { "<leader>li", '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', desc = "Implementations" },
    { "<leader>lo", "<cmd>Lspsaga outline<CR>", desc = "Outline" },
    { "<leader>lpr", "<cmd>Lspsaga project_replace<CR>", desc = "Project Replace" },
    { "<leader>lr", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', desc = "References" },
    { "<leader>lsd", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', desc = "Symbols Document" },
    { "<leader>lsw", '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', desc = "Symbols Workspace" },

    { "<leader>n", group = "Notes" },
    { "<leader>ns", "<cmd>ObsidianSearch<CR>", desc = "Search" },
    { "<leader>nt", "<cmd>ObsidianToday<CR>", desc = "Today" },
    { "<leader>ny", "<cmd>ObsidianYesterday<CR>", desc = "Search" },

    { "<leader>s", group = "Search" },
    { "<leader>sF", "<cmd>lua require('telescope.builtin').git_files()<CR>", desc = "Find File" },
    { "<leader>sf", "<cmd>lua require('telescope.builtin').find_files()<CR>", desc = "Find Git Files" },
    { "<leader>sg", "<cmd>lua require('telescope.builtin').git_status()<CR>", desc = "Git Status" },
    { "<leader>sh", "<cmd>lua require('telescope.builtin').history()<CR>", desc = "History" },
    { "<leader>sib", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", desc = "Current Buffer Fuzzy Find" },
    { "<leader>so", "<cmd>lua require('telescope.builtin').oldfiles()<CR>", desc = "Old files" },
    { "<leader>ssh", "<cmd>lua require('telescope.builtin').search_history()<CR>", desc = "History" },
    { "<leader>st", "<cmd>lua require('telescope.builtin').tags()<CR>", desc = "Tags" },
    { "<leader>sw", "<cmd>lua require('telescope.builtin').grep_string()<CR>", desc = "Word under cursor" },

    { "<leader>t", group = "Test" },
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = "File" },
    { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<CR>", desc = "Last" },
    { "<leader>tn", "<cmd>lua require('neotest').run.run()<CR>", desc = "Nearest" },
    { "<leader>too", "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>", desc = "Output Open" },
    { "<leader>top", "<cmd>lua require('neotest').output_panel.toggle()<CR>", desc = "Output Panel Toggle" },
    { "<leader>tot", "<cmd>lua require('neotest').output.toggle()<CR>", desc = "Output toggle" },
    { "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<CR>", desc = "Summary" },
    { "<leader>ttf", "<cmd>TestFile<CR>", desc = "[t]mux File" },
    { "<leader>ttl", "<cmd>TestLast<CR>", desc = "[t]mux Last" },
    { "<leader>ttn", "<cmd>TestNearest<CR>", desc = "[t]mux Nearest" },

    { "<leader>u", '<cmd>lua require("telescope").extensions.undo.undo()<CR>', desc = "Undo" },

    { "<leader>z", "<cmd>ZenMode<CR>", desc = "Zen" },
})
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
