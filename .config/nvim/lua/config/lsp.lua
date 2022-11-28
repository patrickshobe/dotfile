local capabilities = vim.lsp.protocol.make_client_capabilities()

local nvim_lsp = require 'lspconfig'
local servers = { 'dockerls',
  'eslint',
  'html',
  'jsonls',
  'ruby_ls',
  'solargraph',
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
