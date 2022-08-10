require("bufferline").setup {
  options = {
    numbers = function(opts)
      return string.format("%s.", opts.ordinal)
    end,
    offsets = {
      {
        filetype    = "NvimTree",
        text        = "File Explorer",
        text_align  = "center",
      },
      {
        filetype    = "neo-tree",
        text        = "File Explorer",
        text_align  = "center",
      },
    },
    indicator_icon          = " ",
    close_command           = "Bdelete! %d",
    diagnostics             = false,
    show_buffer_close_icons = true,
    show_close_icon         = false,
    separator_style         = { "", "" },
    show_tab_indicators     = false,
    always_show_bufferline  = true,
    tab_size                = 24,
  },
  highlights = {
    fill = {
      guibg = "#2b3339",
    },
    separator = {
      guibg = "#2b3339",
    },
    modified = {
      guibg = "#2b3339",
    },
    background = {
      guibg = "#2b3339",
    },
    close_button = {
      guibg = "#2b3339",
    },
    numbers = {
      guibg = "#2b3339",
    },
    numbers_selected = {
      gui = "bold",
    },
    buffer_selected = {
      gui = "bold",
    },
  },
}
