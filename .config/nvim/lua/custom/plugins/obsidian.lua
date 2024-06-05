return {
  'epwalsh/obsidian.nvim',
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '/Users/pat/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes'
      },
    },
    daily_notes = {
      folder = 'Inbox/Daily',
    },
  },
}
