local kind_presets = {
  default = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
  },
}

local function setup()
  local cmp = require("cmp")
  local lspkind = require("lspkind")

  cmp.setup({
    sources = {
      { name = "nvim_lsp", priority = 1000 },
      { name = "fuzzy_buffer", priority = 500 },
      { name = "path", priority = 250 },
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
      ["<Tab>"] = cmp.mapping(
        cmp.mapping.select_next_item(),
        { "i", "s", "c" }
      ),
      ["<S-Tab>"] = cmp.mapping(
        cmp.mapping.select_prev_item(),
        { "i", "s", "c" }
      ),
    },
    comparators = {
      cmp.config.compare.exact,
      cmp.config.compare.kind,
      cmp.config.compare.scopes,
      cmp.config.compare.score,
      -- cmp.config.compare.offset,
      -- cmp_under_comparator.under,
      -- cmp.config.compare.sort_text,
      -- cmp.config.compare.length,
      -- cmp.config.compare.order,
    },
    formatting = {
      format = lspkind.cmp_format({
        mode = "symbol",
        maxwidth = 60,
        ellipsis_char = "...",
        preset = "default",
        symbol_map = kind_presets.default,
      }),
    },
    window = {
      completion = {
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
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    view = {
      entries = { name = "custom" },
    },
    sources = cmp.config.sources({
      {
        name = "path",
      },
      {
        name = "cmdline",
        option = {
          ignore_cmds = { 'Man', '!' }
        }
      },
    }),
  })
end

return { setup = setup }
