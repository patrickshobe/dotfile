local nvim_lsp = require 'lspconfig'
local servers = { 'dockerls',
  'eslint',
  'html',
  'jsonls',
  'solargraph',
  'standardrb',
  'sorbet',
  'ruby_ls',
  'lua_ls',
  'tailwindcss',
  'tsserver',
  'yamlls',
  'zk' }

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = function(client, bufnr)
      local basics = require('lsp_basics')
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      basics.make_lsp_commands(client, bufnr)
      basics.make_lsp_mappings(client, bufnr)
    end,
    capabilities = capabilities,
  }
end

local signs = { Error = "⊗ ", Warn = "⊝ ", Hint = "⊚ ", Info = "⊸ " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

