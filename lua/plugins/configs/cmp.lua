local cmp = require("cmp")
local cmp_under_comparator = require("cmp-under-comparator")
local lspkind = require("lspkind")

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

  comparators = {
    cmp.config.compare.offset,
    cmp.config.compare.exact,
    cmp.config.compare.score,
    cmp_under_comparator.under,
    cmp.config.compare.kind,
    cmp.config.compare.sort_text,
    cmp.config.compare.length,
    cmp.config.compare.order,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode          = "symbol",
      maxwidth      = 60,
      ellipsis_char = '...',
    }),
  },
  window = {
    completion = {
      -- winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      side_padding = 1,
    },
  },
  view = {
    entries = { name = "custom" },
  },
}

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    -- { name = "cmdline" },
    { name = "fuzzy_buffer" },
    { name = "buffer" },
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  view = {
    entries = { name = "custom" },
  },
  sources = cmp.config.sources({
    {
      name = "fuzzy_path",
      option = {
        fd_timeout_msec = 1500,
      },
      fd_cmd = {
        "fd", "-d", "5", "-p", "-E", ".venv/**", "-E", ".git/**", "-E", "*.pyc", "-E", "*.o",
      },
    },
    {
      name = "cmdline",
    },
  })
})
