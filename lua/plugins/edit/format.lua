-- TODO: Add typescript, json, yaml, xml
local opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofmt" },
    c = { "clang-format" },
    d2 = { "d2" },
    just = { "just" },
    cpp = { "clang-format" },
    json = { "jq" },
    markdown = { "markdownfmt" },
    ptyhon = { "ruff_organize_imports", "ruff_format" },
    rust = { "rustfmt" },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
}

local function setup()
  require("conform").setup(opts)

  -- NOTE:Uncomment if you need format on save behavior
  --[[ vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  }) ]]
end

return { setup = setup }
