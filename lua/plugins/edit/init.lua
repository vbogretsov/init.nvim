return {
  {
    "windwp/nvim-autopairs",
    commit = "4d74e75",
    event = "InsertEnter",
    config = require("plugins.edit.autopairs").setup,
  },
  {
    "b3nj5m1n/kommentary",
    commit = "d5a111a",
    event = "VeryLazy",
    dependencies = { "none-ls-extras.nvim" },
    config = require("plugins.edit.comments").setup,
  },
  {
    "kylechui/nvim-surround",
    tag = "v3.1.2",
    event = "VeryLazy",
    config = require("plugins.edit.surround").setup,
  },
  {
    "hrsh7th/nvim-cmp",
    commit = "b5311ab",
    event = "InsertEnter",
    config = require("plugins.edit.autocomplete").setup,
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "a8912b8",
    event = "InsertEnter",
  },
  {
    "hrsh7th/cmp-path",
    commit = "c6635aa",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "vbogretsov/cmp-cmdline",
    -- commit = "c66c379",
    commit = "ef45321",
    event = "CmdlineEnter",
  },
  {
    "tzachar/cmp-fuzzy-buffer",
    -- commit = "5da5f20",
    commit = "ada6352",
    event = "InsertEnter",
    dependencies = {
      "nvim-cmp",
      "tzachar/fuzzy.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "onsails/lspkind.nvim",
    commit = "d79a1c3",
    event = "InsertEnter",
  },
  {
    "dhruvasagar/vim-table-mode",
    tag = "v4.8.1",
    cmd = "TableModeEnable",
  },
}

