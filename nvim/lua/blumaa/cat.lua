local colors = require("blumaa.config.colors").colors
local prompt = colors.magenta_dark
local results = colors.dark_violet
local preview = colors.grey18


require("catppuccin").setup({
  -- flavour = "mocha",   -- latte, frappe, macchiato, mocha
  -- background = {       -- :h background
  --   light = "latte",
  --   dark = "mocha",
  -- },
  -- transparent_background = false,
  -- term_colors = false,
  -- dim_inactive = {
  --   enabled = false,
  --   shade = "dark",
  --   percentage = 0.15,
  -- },
  -- no_italic = false,   -- Force no italic
  -- no_bold = false,     -- Force no bold
  -- styles = {
  --   comments = { "italic" },
  --   conditionals = { "italic" },
  --   loops = {},
  --   functions = {},
  --   keywords = {},
  --   strings = {},
  --   variables = {},
  --   numbers = {},
  --   booleans = {},
  --   properties = {},
  --   types = {},
  --   operators = {},
  -- },
  -- color_overrides = {},
  -- custom_highlights = {
  --   TelescopeMatching = { fg = colors.blue },
  --   TelescopeNormal = { fg = colors.grey8 },
  --   TelescopePreviewBorder = { bg = preview, fg = preview },
  --   TelescopePreviewNormal = { bg = preview },
  --   TelescopePreviewTitle = { fg = preview },
  --   TelescopePromptBorder = { bg = prompt, fg = prompt },
  --   TelescopePromptNormal = { bg = prompt },
  --   TelescopePromptPrefix = { bg = prompt },
  --   TelescopePromptTitle = { fg = prompt },
  --   TelescopeResultsBorder = { bg = results, fg = results },
  --   TelescopeResultsNormal = { bg = results },
  --   TelescopeResultsTitle = { fg = results },
  --   -- The current item
  --   TelescopeSelection = { fg = colors.magenta_dark, bg = results },
  --   TelescopeSelectionCaret = { fg = colors.magenta_dark, bg = results },
  -- },
  -- integrations = {
  --   cmp = true,
  --   gitsigns = true,
  --   nvimtree = true,
  --   telescope = true,
  --   notify = false,
  --   mini = false,
  --   -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  -- },
})
