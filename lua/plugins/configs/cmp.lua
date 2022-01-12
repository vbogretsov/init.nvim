local cmp = require("cmp")

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  },
}

cmp.setup.cmdline("/", {
  sources = {
    { name = "fuzzy_buffer" },
  }
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "cmdline" },
    {
      name = "fuzzy_path",
      options = { fd_cmd = {
        "fd",
        "--type",
        "f",
        "--max-depth",
        "10",
        "--hidden",
        "--strip-cwd-prefix",
        "--exclude",
        ".git",
        "--exclude",
        ".venv",
        "--exclude",
        "__pycache__",
      } },
    },
    { name = "fuzzy_buffer" },
  }
})
