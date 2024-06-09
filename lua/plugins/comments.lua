local opts = {
  prefer_single_line_comments = true,
}

return {
  {
    "b3nj5m1n/kommentary",
    commit = "d5a111a",
    config = function()
      require("kommentary.config").configure_language(opts)
    end,
  },
}
