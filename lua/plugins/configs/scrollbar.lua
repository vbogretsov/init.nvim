local palette = vim.fn["my#get_palette"]()


require("scrollbar").setup({
  marks = {
    Search = { color = palette["fg"][1] },
    Error = { color = palette["red"][1] },
    Warn = { color = palette["yellow"][1] },
    Info = { color = palette["green"][1] },
    Hint = { color = palette["aqua"][1] },
    Misc = { color = palette["cyan"] },
  },
  handlers = {
    diagnostic = true,
    search     = true,
  },
})

require("hlslens").setup({
   build_position_cb = function(plist, _, _, _)
      require("scrollbar.handlers.search").handler.show(plist.start_pos)
   end,
})

vim.cmd([[
  augroup scrollbar_search_hide
    autocmd!
    autocmd CmdlineLeave : lua require("scrollbar.handlers.search").handler.hide()
  augroup END
]])
