local palette = vim.fn["my#get_palette"]()

local cursor_color = palette["bg2"][1]

require("scrollbar").setup({
  set_highlights = true,
  marks = {
    Cursor = {
      priority  = 10,
      text      = " ",
      blend     = 30,
      color     = cursor_color,
      gui       = cursor_color,
      color_nr  = cursor_color,
    },
    Search = {
      priority  = 1,
      gui       = cursor_color,
    },
    Error = {
      priority  = 2,
      gui       = cursor_color,
    },
    Warn = {
      priority  = 3,
      gui       = cursor_color,
    },
    Info = {
      priority  = 4,
      gui       = cursor_color,
    },
    Hint = {
      priority  = 5,
      gui       = cursor_color,
    },
    Misc = {
      priority  = 6,
      gui       = cursor_color,
    },
  },
  handle = {
    blend     = 30,
    color     = cursor_color,
    gui       = cursor_color,
    color_nr  = cursor_color,
  },
  handlers = {
    diagnostic = true,
    search     = true,
    cursor     = true,
    handle     = true,
  },
  excluded_buftypes = {
    "terminal",
  },
  excluded_filetypes = {
    "cmp_menu",
    "prompt",
    "TelescopePrompt",
    "noice",
    "neo-tree",
  },
})

vim.cmd(string.format("hi ScrollbarHandle guibg=%s", cursor_color))
vim.cmd(string.format("hi ScrollbarCursorHandle guibg=%s", cursor_color))
vim.cmd(string.format("hi ScrollbarSearchHandle guibg=%s", cursor_color))
vim.cmd(string.format("hi ScrollbarErrorHandle guibg=%s guifg=%s", cursor_color, palette["red"][1]))
vim.cmd(string.format("hi ScrollbarError guifg=%s", palette["red"][1]))
vim.cmd(string.format("hi ScrollbarWarnHandle guibg=%s guifg=%s", cursor_color, palette["yellow"][1]))
vim.cmd(string.format("hi ScrollbarWarn guifg=%s", palette["yellow"][1]))
vim.cmd(string.format("hi ScrollbarInfoHandle guibg=%s guifg=%s", cursor_color, palette["green"][1]))
vim.cmd(string.format("hi ScrollbarInfo guifg=%s", palette["green"][1]))
vim.cmd(string.format("hi ScrollbarHintHandle guibg=%s guifg=%s", cursor_color, palette["aqua"][1]))
vim.cmd(string.format("hi ScrollbarHint guifg=%s", palette["aqua"][1]))
vim.cmd(string.format("hi ScrollbarMiscHandle guibg=%s guifg=%s", cursor_color, palette["purple"][1]))
vim.cmd(string.format("hi ScrollbarMisc guifg=%s", palette["purple"][1]))
