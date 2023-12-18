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
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- local lsp = require("lsp-zero")
--
-- lsp.preset("recommended")
--
-- -- lsp.ensure_installed({
-- -- })
-- --
-- -- lsp.setup_servers({ 'rust_analyzer' })
--
-- -- Fix Undefined global 'vim'
-- lsp.configure('lua_ls', {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }
--       }
--     }
--   }
-- })
--
-- local function organize_imports()
--   local params = {
--     command = "_typescript.organizeImports",
--     arguments = { vim.api.nvim_buf_get_name(0) },
--     title = ""
--   }
--   vim.lsp.buf.execute_command(params)
-- end
--
-- lsp.configure('tsserver', {
--   -- single_file_support = false,
--   on_attach = function(client, bufnr)
--     print('hello tsserver')
--   end,
--   commands = {
--     OrganizeImports = {
--       organize_imports,
--       description = "Organize Imports"
--     }
--   }
-- })
--
--
local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })
--
require('luasnip.loaders.from_vscode').lazy_load()
require 'luasnip'.filetype_extend("ruby", { "rails" })
--
-- disable completion with tab
-- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
--
cmp.setup {
  sources = {
    { name = "luasnip",           group_index = 2 },
    { name = "vsnip",             group_index = 2 },
    -- Copilot Source
    { name = "copilot",           group_index = 2 },
    -- Other Sources
    { name = "friendly-snippets", group_index = 2 },
    { name = "nvim_lsp",          group_index = 2 },
    { name = "path",              group_index = 2 },
  },
}
--
-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })
--
-- -- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
-- -- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
--
-- lsp.set_preferences({
--   suggest_lsp_servers = true,
--   sign_icons = {
--     error = 'E',
--     warn = 'W',
--     hint = 'H',
--     info = 'I'
--   }
-- })
--
-- lsp.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }
--
--   -- if client.name == "eslint" then
--   --   vim.cmd.LspStop('eslint')
--   --   return
--   -- end
--
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
--   vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
--   vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--   vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--   vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
--   vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
--   vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
--   vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)
--
-- lsp.setup()
--
-- vim.diagnostic.config({
--   virtual_text = true,
-- })
