
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
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      basics.make_lsp_commands(client, bufnr)
      basics.make_lsp_mappings(client, bufnr)
    end,
    capabilities = capabilities,
  }
end


require('lint').linters.your_linter_name = {
  cmd = 'syntax_suggest',
  stdin = true, -- or false if it doesn't support content input via stdin. In that case the filename is automatically added to the arguments.
  append_fname = true, -- Automatically append the file name to `args` if `stdin = false` (default: true)
  args = {}, -- list of arguments. Can contain functions with zero arguments that will be evaluated once the linter is used.
  stream = nil, -- ('stdout' | 'stderr' | 'both') configure the stream to which the linter outputs the linting result.
  ignore_exitcode = false, -- set this to true if the linter exits with a code != 0 and that's considered normal.
  env = nil, -- custom environment table to use with the external process. Note that this replaces the *entire* environment, it is not additive.
}

 vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead", "TextChanged", "InsertLeave" }, {
   callback = function()
     require("lint").try_lint()
   end,
 })

