local background = "#2b3339"

local opts = {
  options = {
    numbers = function(opts)
      return string.format("%s.", opts.ordinal)
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
      },
      {
        filetype = "drex",
        text = "File Explorer",
        text_align = "center",
      },
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
      },
    },
    indicator = {
      icon = " ",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_command = "Bdelete! %d",
    diagnostics = false,
    show_buffer_close_icons = true,
    show_close_icon = false,
    separator_style = { "", "" },
    show_tab_indicators = false,
    always_show_bufferline = true,
    tab_size = 24,
  },
  highlights = {
    fill = {
      bg = background,
    },
    separator = {
      bg = background,
    },
    modified = {
      bg = background,
    },
    background = {
      bg = background,
    },
    close_button = {
      bg = background,
    },
    numbers = {
      bg = background,
    },
    numbers_selected = {
      bold = true,
      italic = false,
    },
    buffer_selected = {
      bold = true,
      italic = false,
    },
  },
}

return { opts = opts }
