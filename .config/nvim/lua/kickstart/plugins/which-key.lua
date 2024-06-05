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
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register({
        f = { "<cmd>lua require('ranger-nvim').open(true)<CR>", 'File' },
        z = { "<cmd>ZenMode<CR>", 'Zen' },
        F = { "<cmd>lua require('ranger-nvim').open(false)<CR>", 'File Root' },
        N = { '<cmd>Notifications<CR>', 'Notifications' },
        cp = { '<cmd>Copilot panel<CR>', 'Copilot' },
        u = { '<cmd>lua require("telescope").extensions.undo.undo()<CR>', 'Undo' },
        n = {
          name = 'Notes',
          t = { '<cmd>ObsidianToday<CR>', 'Today' },
          s = { '<cmd>ObsidianSearch<CR>', 'Search' },
          y = { '<cmd>ObsidianYesterday<CR>', 'Search' },
        },
        g = {
          name = 'Git',
          b = { '<cmd>GBrowse<CR>', 'Browse' },
          g = { '<cmd>LazyGit<CR>', 'Lazy' },
          l = { '<cmd>LazyGitFilter<CR>', 'Log' },
        },
        b = {
          name = 'Buffers',
          d = { '<cmd>BufferDelete<CR>', 'Delete' },
          D = { '<cmd>BufferPickDelete<CR>', 'Pick Delete' },
          j = { '<cmd>BufferPrevious<CR>', 'Previous' },
          k = { '<cmd>BufferNext<CR>', 'Next' },
          p = { '<cmd>BufferPick<CR>', 'Pick' },
          q = { '<cmd>BufferCloseAllButPinned<CR>', 'Clear' },
        },
        s = {
          name = 'Search',
          F = { "<cmd>lua require('telescope.builtin').git_files()<CR>", 'Find File' },
          f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'Find Git Files' },
          g = { "<cmd>lua require('telescope.builtin').git_status()<CR>", 'Git Status' },
          sh = { "<cmd>lua require('telescope.builtin').search_history()<CR>", 'History' },
          ib = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", 'Current Buffer Fuzzy Find' },
          h = { "<cmd>lua require('telescope.builtin').history()<CR>", 'History' },
          o = { "<cmd>lua require('telescope.builtin').oldfiles()<CR>", 'Old files' },
          t = { "<cmd>lua require('telescope.builtin').tags()<CR>", 'Tags' },
          w = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", 'Word under cursor' },
        },
        t = {
          name = 'Test',
          tf = { '<cmd>TestFile<CR>', '[t]mux File' },
          f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", 'File' },
          tl = { '<cmd>TestLast<CR>', '[t]mux Last' },
          l = { "<cmd>lua require('neotest').run.run_last()<CR>", 'Last' },
          tn = { '<cmd>TestNearest<CR>', '[t]mux Nearest' },
          n = { "<cmd>lua require('neotest').run.run()<CR>", 'Nearest' },
          oo = { "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<CR>", 'Output Open' },
          ot = { "<cmd>lua require('neotest').output.toggle()<CR>", 'Output toggle' },
          op = { "<cmd>lua require('neotest').output_panel.toggle()<CR>", 'Output Panel Toggle' },
          s = { "<cmd>lua require('neotest').summary.toggle()<CR>", 'Summary' },
        },
        d = {
          name = 'Diagnostics',
          o = { '<cmd>lua require("trouble").toggle()<CR>', 'toggle' },
          w = { '<cmd>lua require("trouble").toggle("workspace_diagnostics")<CR>', 'Workspace Diagnostics' },
          d = { '<cmd>lua require("trouble").toggle("document_diagnostics")<CR>', 'Document Diagnostics' },
          q = { '<cmd>lua require("trouble").toggle("quickfix")<CR>', 'Quickfix' },
          l = { '<cmd>lua require("trouble").toggle("loclist")<CR>', 'Quickfix' },
          r = { '<cmd>lua require("trouble").toggle("lsp_references")<CR>', 'References' },
          t = { '<cmd>lua require("trouble").toggle("neotest")<CR>', 'References' },
        },
        l = {
          name = 'Lsp',
          d = { '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', 'Definitions' },
          D = { '<cmd>lua require("telescope.builtin").lsp_type_definitions()<CR>', 'Type Definitions' },
          r = { '<cmd>lua require("telescope.builtin").lsp_references()<CR>', 'References' },
          i = { '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>', 'Implementations' },
          sd = { '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', 'Symbols Document' },
          sw = { '<cmd>lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<CR>', 'Symbols Workspace' },
          R = { '<cmd>Lspsaga rename<CR>', 'Rename' },
          a = { '<cmd>Lspsaga code_action<CR>', 'Action' },
          h = { '<cmd>Lspsaga hover<CR>', 'Hover' },
          o = { '<cmd>Lspsaga outline<CR>', 'Outline' },
          pr = { '<cmd>Lspsaga project_replace<CR>', 'Project Replace' },
          e = { '<cmd>Lspsaga peek_definition<CR>', 'Peek Definition' },
          f = { '<cmd>lua vim.lsp.buf.format()<CR>', 'format' },
        },
      }, { prefix = '<leader>' })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
