local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "buffers",
    close_command = "bdelete! %d",
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 28,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 28,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'underline',
    },
    -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
    diagnostics_indicator = function(count)
      return "(" .. count .. ")"
    end,
    offsets = { { filetype = "NvimTree", text_align = "left" } },
    color_icons = true,
    show_buffer_close_icons = true,
    always_show_bufferline = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "thick",
    sort_by = 'relative_directory', -- | 'directory' | 'tabs' | function(buffer_a, buffer_b)
  },
  highlights = {
    --[[ separator = { ]]
    --[[   fg = '#fc03ca', ]]
    --[[   bg = '#fc03ca', ]]
    --[[ }, ]]
    --[[ separator_selected = { ]]
    --[[   fg = '#073642', ]]
    --[[ }, ]]
    --[[ background = { ]]
    --[[   fg = '#657b83', ]]
    --[[   bg = '#002b36' ]]
    --[[ }, ]]
    --[[ buffer_selected = { ]]
    --[[   fg = '#fdf6e3', ]]
    --[[   bg = '#37eb34' ]]
    --[[ }, ]]
    --[[ indicator_selected = { ]]
    --[[   fg = '#fc03ca', ]]
    --[[   bg = '#fc03ca', ]]
    --[[ }, ]]
    --[[ fill = { ]]
    --[[   bg = '#073642' ]]
    --[[ } ]]
  },
})
