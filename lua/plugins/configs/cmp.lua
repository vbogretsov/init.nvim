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
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
  },
}

cmp.setup.cmdline("/", {
  sources = {
    { name = "cmdline" },
    { name = "fuzzy_buffer" },
    { name = "buffer" },
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = "cmdline" },
  })
})
