local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'moonfly',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      'mode',
      {
        'filename',
        path = 0,
      }
    },
    lualine_b = {'branch', 'diff', {'diagnostics', sources = { 'nvim_lsp' }}},
    lualine_c = {},
    lualine_x = { 'encoding', 'fileformat', {'filetype', colored = true, icon_only = false, }},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

