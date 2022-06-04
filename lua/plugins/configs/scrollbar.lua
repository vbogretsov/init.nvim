require("scrollbar").setup({
  marks = {
    Search = { color = "#d3c6aa" },
    Error = { color = "#e67e80" },
    Warn = { color = "#dbbc7f" },
    Info = { color = "#a7c080" },
    Hint = { color = "#83c092" },
    Misc = { color = "#d699b6" },
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
