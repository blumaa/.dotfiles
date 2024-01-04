local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({
  'tsserver',
  'eslint',
  'lua_ls',
  'solargraph',
})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'lua_ls',
    'solargraph',
  },
  handlers = {
    lsp_zero.default_setup,
  },
})

require("luasnip.loaders.from_vscode").lazy_load()

local lspkind = require('lspkind')
local luasnip = require 'luasnip'

luasnip.config.setup {}

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format()
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    -- { name = "friendly-snippets" },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },

    -- { name = "vsnip",             group_index = 2 },
    -- Copilot Source
    -- { name = "copilot",           group_index = 2 },
    -- Other Sources
    -- { name = "nvim_lsp",          group_index = 2 },
    -- { name = "path",              group_index = 2 },
  },
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),

    -- scroll up and down the documentation window
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),
  -- formatting = cmp_format,
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',       -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    })
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}
