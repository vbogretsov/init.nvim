local function setup()
  local cmp = require("cmp")
  local cmp_under_comparator = require("cmp-under-comparator")
  local lspkind = require("lspkind")

  cmp.setup({
    sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
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
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "fuzzy_buffer" },
    }
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    view = {
      entries = { name = "custom" },
    },
    sources = cmp.config.sources({
      {
        name = "cmdline",
      },
    })
  })
end

return {
  {
    "tzachar/fuzzy.nvim",
    commit   = "67a42ad",
    event    = "VeryLazy",
  },
  {
    "hrsh7th/nvim-cmp",
    commit = "a110e12",
    event  = "VeryLazy",
    config = setup,
  },
  {
    "hrsh7th/cmp-path",
    commit = "91ff86c",
    event  = "VeryLazy",
  },
  {
    "hrsh7th/cmp-buffer",
    commit = "3022dbc",
    event  = "VeryLazy",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "39e2eda",
    event    = "VeryLazy",
  },
  {
    "hrsh7th/cmp-cmdline",
    commit = "c66c379",
    event    = "VeryLazy",
  },
  {
    "tzachar/cmp-fuzzy-buffer",
    commit = "5da5f20",
    event    = "VeryLazy",
    dependencies = { "nvim-cmp", "fuzzy.nvim" },
  },
  {
    "lukas-reineke/cmp-under-comparator",
    commit = "6857f10",
    event    = "VeryLazy",
  },
  {
    "onsails/lspkind.nvim",
    commit = "7a41b98",
    event    = "VeryLazy",
  },
}
