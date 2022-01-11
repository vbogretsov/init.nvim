require("scrollbar").setup({
  handle = {
    color = "#374247",
  },
  marks = {
    Search = { text = { "-", "=" }, priority = 0, color = "#a7c080" },
    Error = { text = { "-", "=" }, priority = 1, color = "#e67e80" },
    Warn = { text = { "-", "=" }, priority = 2, color = "#dbbc7f" },
    Info = { text = { "-", "=" }, priority = 3, color = "#7fbbb3" },
    Hint = { text = { "-", "=" }, priority = 4, color = "#4b565c" },
    Misc = { text = { "-", "=" }, priority = 5, color = "#d699b6" },
  },
})

