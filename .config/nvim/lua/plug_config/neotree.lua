vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup({
  default_component_configs = {
    window = {
      position = "left",
      width = 30,
    },
    filesystem = {
      follow_current_file = true,
    }
  },
})
