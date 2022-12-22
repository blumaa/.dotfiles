--[[ local status_ok, eyeliner = pcall(require, "eyeliner") ]]
--[[ if not status_ok then ]]
--[[   return ]]
--[[ end ]]

--[[ vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = true, underline = true }) ]]
--[[ vim.api.nvim_set_hl(0, 'EyelinerSecondary', { underline = true }) ]]
--[[ vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#000000', bold = true, underline = true }) ]]
--[[ vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#ffffff', underline = true }) ]]

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = true, underline = true })
  end,
})
