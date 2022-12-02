local capabilities = vim.lsp.protocol.make_client_capabilities()

local nvim_lsp = require 'lspconfig'
local servers = { 'dockerls',
  'eslint',
  'html',
  'jsonls',
  'solargraph',
  'ruby_ls',
  'sumneko_lua',
  'tailwindcss',
  'tsserver',
  'yamlls',
  'zk' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = function(client, bufnr)
      local basics = require('lsp_basics')

      basics.make_lsp_commands(client, bufnr)
      basics.make_lsp_mappings(client, bufnr)
    end,
    capabilities = capabilities,
  }
end

 require('lint').linters_by_ft = {
   ruby = {'rubocop',}
 }

 vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead", "TextChanged", "InsertLeave" }, {
   callback = function()
     require("lint").try_lint()
   end,
 })

