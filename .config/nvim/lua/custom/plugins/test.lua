return {
  {
    'vim-test/vim-test',
    config = function()
      vim.cmd [[
  let test#strategy = "vimux"
  let test#ruby#rspec#options = '--format p'
]]
    end,
  },
  { 'preservim/vimux' },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'olimorris/neotest-rspec',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('neotest').setup {
        output = { open_on_run = true },
        adapters = {
          require 'neotest-rspec' {
            rspec_cmd = function()
              return vim.tbl_flatten {
                'bundle',
                'exec',
                'rspec',
              }
            end,
          },
        },
        config = function(_, opts)
          local neotest_ns = vim.api.nvim_create_namespace 'neotest'
          vim.diagnostic.config({
            virtual_text = {
              format = function(diagnostic)
                -- Replace newline and tab characters with space for more compact diagnostics
                local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
                return message
              end,
            },
          }, neotest_ns)

          if require('lazyvim.util').has 'trouble.nvim' then
            opts.consumers = opts.consumers or {}
            -- Refresh and auto close trouble after running tests
            ---@type neotest.Consumer
            opts.consumers.trouble = function(client)
              client.listeners.results = function(adapter_id, results, partial)
                if partial then
                  return
                end
                local tree = assert(client:get_position(nil, { adapter = adapter_id }))

                local failed = 0
                for pos_id, result in pairs(results) do
                  if result.status == 'failed' and tree:get_key(pos_id) then
                    failed = failed + 1
                  end
                end
                vim.schedule(function()
                  local trouble = require 'trouble'
                  if trouble.is_open() then
                    trouble.refresh()
                    if failed == 0 then
                      trouble.close()
                    end
                  end
                end)
                return {}
              end
            end
          end
        end,
      }
    end,
  },
}
