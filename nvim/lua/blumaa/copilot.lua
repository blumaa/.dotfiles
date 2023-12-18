require('copilot').setup({
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "right", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<leader>c",
      accept_word = false,
      accept_line = false,
      next = "<leader>n",
      prev = "<leader>l",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    help = false,
    gitcommit = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node',
  server_opts_overrides = {},
})
