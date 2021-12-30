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
    },
    close_command           = "Bdelete! %d",
    diagnostics             = false,
    show_buffer_close_icons = true,
    show_close_icon         = false,
    separator_style         = "thin",
    show_tab_indicators     = false,
    always_show_bufferline  = true,
    tab_size                = 24,
  },
  highlights = {
    fill = {
      guibg = "#232a2e",
    },
    buffer_selected = {
      gui = "",
    },
  },
}