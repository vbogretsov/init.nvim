local present, packer = pcall(require, "plugins.setup")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

  local telescope_fzf_native = {
    "nvim-telescope/telescope-fzf-native.nvim",
    commit = "6c921ca",
    run    = "make",
  }

  local telescope_ui_select = {
    "nvim-telescope/telescope-ui-select.nvim",
    commit = "62ea5e5",
  }

  local cmp_under_cursor = {
    "lukas-reineke/cmp-under-comparator",
    commit = "6857f10",
  }

  local lspkind = {
    "onsails/lspkind.nvim",
    commit = "57610d5",
  }

  use {
    "wbthomason/packer.nvim",
  }

  use "nvim-lua/plenary.nvim"

  use {
    "sainnhe/everforest",
    commit = "83b6664",
  }

  -- Proper buffer deletion
  use {
    "famiu/bufdelete.nvim",
    commit = "07d1f8b",
    cmd    = "MyPlugInit",
  }

  -- Clipboard
  use {
    "vbogretsov/easyclip.vim",
    cmd = "MyPlugInit",
  }

  -- Scrollbar
  use {
    "petertriho/nvim-scrollbar",
    commit  = "35f99d5",
    config  = "require'plugins.configs.scrollbar'",
    cmd     = "MyPlugInit",
    requires = {
      "kevinhwang91/nvim-hlslens",
      commit = "5e3e908",
      config = "require'plugins.configs.hlslens'",
    },
  }

  -- Icons
  use {
    "nvim-tree/nvim-web-devicons",
    commit = "b844d3d",
    config = "require'plugins.configs.devicons'",
    cmd    = "MyPlugInit",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "45e27ca",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "nvim-web-devicons",
  }

  -- Buffer line
  use {
    "akinsho/bufferline.nvim",
    commit   = "99f0932",
    config   = "require'plugins.configs.bufferline'",
    requires = "kyazdani42/nvim-web-devicons",
    event    = "VimEnter",
  }

  -- File browser
  use {
    "nvim-neo-tree/neo-tree.nvim",
    commit    = "1424449",
    cmd       = { "Neotree" },
    config    = "require'plugins.configs.neotree'",
    requires  = {
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }

  -- Color column
  use {
    "lukas-reineke/virt-column.nvim",
    tag    = "v1.5.6",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.colorcolumn'",
  }

  -- Indent balnk lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    tag    = "v2.20.7",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.indent'",
    after  = "nvim-treesitter",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "ae5b41c",
    event   = "InsertEnter",
    config  = "require'plugins.configs.autopairs'",
  }

  -- Surround
  use {
    "tpope/vim-surround",
    tag   = "v2.2",
    cmd   = "MyPlugInit",
  }

  -- Comments
  use {
    "b3nj5m1n/kommentary",
    commit = "3a80117",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.kommentary'",
  }

  use {
    "norcalli/nvim-colorizer.lua",
    commit  = "36c610a",
    cmd     = "MyPlugInit",
    config  = "require'plugins.configs.colorizer'",
  }

  use {
    "tzachar/fuzzy.nvim",
    commit   = "67a42ad",
    cmd      = "MyPlugInit",
    requires = {
      telescope_fzf_native,
    },
  }

  -- Navigation
  -- NOTE: Requires to be installed: `ripgrep`, `fd`
  use {
    "nvim-telescope/telescope.nvim",
    commit    = "40c8d2f",
    cmd       = "Telescope",
    config    = "require'plugins.configs.telescope'",
    requires  = {
      "nvim-lua/plenary.nvim",
      telescope_fzf_native,
      telescope_ui_select,
    },
  }

  -- Tree-Sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "af6b3ec",
    cmd    = "MyPlugInit",
    run    = ":TSUpdate",
    config = "require'plugins.configs.treesitter'",
  }

  -- TODO: consider nvim-ts-context-commentstring

  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    commit   = "5dce1b7",
    cmd      = "MyPlugInit",
    config   = "require'plugins.configs.cmp'",
    requires  = {
      cmp_under_cursor,
      lspkind,
    }
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "44b16d1",
    after  = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-vsnip",
    commit = "989a8a7",
    after  = "cmp-nvim-lsp",
  }

  use {
    "hrsh7th/vim-vsnip",
    commit = "7753ba9",
    after  = "cmp-vsnip",
  }

  use {
    "hrsh7th/cmp-path",
    commit = "91ff86c",
    after  = "vim-vsnip",
  }

  use {
    "hrsh7th/cmp-buffer",
    commit = "3022dbc",
    after  = "cmp-path",
  }

  use {
    "hrsh7th/cmp-cmdline",
    commit = "c66c379",
    -- commit = "8ee981b",
    after  = "nvim-cmp"
  }

  use {
    "tzachar/cmp-fuzzy-buffer",
    commit  = "5da5f20",
    after   = "nvim-cmp",
    requires = {"hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim"}
  }

  use {
    "tzachar/cmp-fuzzy-path",
    commit   = "0caa348",
    after    = "nvim-cmp",
    requires = {"hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim"}
  }

  -- LSP
  use {
    "vbogretsov/nvim-lspconfig",
    after    = "cmp-nvim-lsp",
    config   = "require'plugins.configs.lspconfig'",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    commit = "7de0125",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.gitsigns'",
  }

  use {
    "akinsho/git-conflict.nvim",
    commit = "8962619",
    config = "require'plugins.configs.gitconflict'",
  }

  use {
    "dhruvasagar/vim-table-mode",
    tag = "v4.7.6.1",
    cmd = "TableModeEnable",
  }

  use {
    "jbyuki/venn.nvim",
    commit = "c114563",
    cmd = "MyPlugInit",
  }

  use {
    "akinsho/toggleterm.nvim",
    commit = "0427b90",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.toggleterm'",
  }

  -- Markdown preview
  use {
    "toppair/peek.nvim",
    commit = "67752e7",
    run    = "deno task --quiet build:fast",
    config = "require'plugins.configs.peek'",
  }

end)
