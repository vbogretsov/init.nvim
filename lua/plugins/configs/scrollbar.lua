require("scrollbar").setup({
  set_highlights = true,
  marks = {
    Cursor = {
      priority  = 10,
      text      = " ",
    },
    Search = {
      priority  = 1,
    },
    Error = {
      priority  = 2,
    },
    Warn = {
      priority  = 3,
    },
    Info = {
      priority  = 4,
    },
    Hint = {
      priority  = 5,
    },
    Misc = {
      priority  = 6,
    },
  },
  handlers = {
    diagnostic = true,
    search     = true,
    cursor     = true,
    handle     = true,
  },
  excluded_buftypes = {
    "terminal",
    "TelescopePrompt",
    "TelescopeResults",
    "packer",
    "lspsaga",
  },
  excluded_filetypes = {
    "packer",
    "lspsaga",
    "cmp_menu",
    "prompt",
    "TelescopePrompt",
    "TelescopeResults",
    "noice",
    "neo-tree",
  },
})

local palette = vim.fn["my#get_palette"]()
local cursor_color = palette["bg1"][1]
local cursor_blend = 0

vim.cmd(string.format("hi ScrollbarHandle guibg=%s blend=%s", cursor_color, cursor_blend))
vim.cmd(string.format("hi ScrollbarCursorHandle guibg=%s blend=%s", cursor_color, cursor_blend))
vim.cmd(string.format("hi ScrollbarSearchHandle guibg=%s blend=%s", cursor_color, cursor_blend))
vim.cmd(string.format("hi ScrollbarErrorHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["red"][1], cursor_blend))
vim.cmd(string.format("hi ScrollbarError guifg=%s", palette["red"][1]))
vim.cmd(string.format("hi ScrollbarWarnHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["yellow"][1], cursor_blend))
vim.cmd(string.format("hi ScrollbarWarn guifg=%s", palette["yellow"][1]))
vim.cmd(string.format("hi ScrollbarInfoHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["green"][1], cursor_blend))
vim.cmd(string.format("hi ScrollbarInfo guifg=%s", palette["green"][1]))
vim.cmd(string.format("hi ScrollbarHintHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["aqua"][1], cursor_blend))
vim.cmd(string.format("hi ScrollbarHint guifg=%s", palette["aqua"][1]))
vim.cmd(string.format("hi ScrollbarMiscHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["purple"][1], cursor_blend))
vim.cmd(string.format("hi ScrollbarMisc guifg=%s", palette["purple"][1]))
