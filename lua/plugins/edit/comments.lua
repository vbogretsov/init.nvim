local opts = {
  prefer_single_line_comments = true,
}

local function setup()
  require("kommentary.config").configure_language(opts)
end

return { setup = setup }
