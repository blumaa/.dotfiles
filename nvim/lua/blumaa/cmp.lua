local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local status, cmp = pcall(require, "cmp")
if (not status) then return end
local lspkind = require 'lspkind'

require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
              return
            end
            fallback()
          end
	, { 'i', 'c' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
								if cmp.visible() then
									cmp.select_prev_item()
									return
								end
								fallback()
							end
	, { 'i', 'c' }),
  }),
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = 'nvim_lsp' },
    { name = "nvim_lua" },
    { name = 'buffer' },
  }),
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  formatting = {
    format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },

})

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

