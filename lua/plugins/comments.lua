local opts = {
  prefer_single_line_comments = true,
}

local function setup()
  require("kommentary.config").configure_language(opts)
end

return {
  {
    "b3nj5m1n/kommentary",
    commit = "d5a111a",
    -- TODO: start on keys
    event = "BufReadPost",
    dependencies = { "none-ls-extras.nvim" },
    config = setup,
  },
}
