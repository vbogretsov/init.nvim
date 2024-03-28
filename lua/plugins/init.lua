vim.cmd[[packadd packer.nvim]]

local present, packer = pcall(require, "packer")
if not present then
  return
end

packer.init {
   display = {
      open_fn = function()
         return require("packer.util").float({ border = "single" })
      end,
      prompt_border = "single",
   },
   git = {
      clone_timeout = 6000, -- seconds
   },
   auto_clean      = true,
   compile_on_sync = true,
}

return packer.startup(function()
  local use = packer.use

  use {
    "wbthomason/packer.nvim",
  }

  use "nvim-lua/plenary.nvim"

  use {
    "sainnhe/everforest",
    commit = "72f101b",
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
    -- commit = "b844d3d",
    commit = "5efb8bd",
    config = "require'plugins.configs.devicons'",
    cmd    = "MyPlugInit",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "2248ef2",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "nvim-web-devicons",
  }

  -- Buffer line
  use {
    "akinsho/bufferline.nvim",
    -- commit   = "99f0932",
    commit   = "1a33975",
    config   = "require'plugins.configs.bufferline'",
    requires = "kyazdani42/nvim-web-devicons",
    event    = "VimEnter",
  }

  -- File browser
  use {
    "nvim-neo-tree/neo-tree.nvim",
    commit    = "1424449",
    -- commit    = "230ff11",
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
    tag    = "v2.0.2",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.colorcolumn'",
  }

  -- Indent balnk lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    -- tag    = "v2.20.7",
    tag    = "v3.3.8",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.indent'",
    after  = "nvim-treesitter",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "0f04d78",
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
    commit = "d5a111a",
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
  -- use {
  --   "Bekaboo/dropbar.nvim",
  --   commit = "9405df5",
  --   config = function()
  --   end,
  -- }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    commit = "6c921ca",
    run    = "make",
  }

  use {
    "nvim-telescope/telescope-ui-select.nvim",
    commit = "62ea5e5",
  }

  -- NOTE: Requires to be installed: `ripgrep`, `fd`
  use {
    "nvim-telescope/telescope.nvim",
    commit    = "84c5a71",
    cmd       = "Telescope",
    config    = "require'plugins.configs.telescope'",
    after     = {
      "plenary.nvim",
      "telescope-fzf-native.nvim",
      "telescope-ui-select.nvim",
    },
  }

  -- use {
  --   "nvimdev/lspsaga.nvim",
  --   commit = "b1b140a",
  --   config = "require'plugins.configs.lspsaga'",
  -- }

  -- Tree-Sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    commit = "7958ff9",
    -- commit = "80a16de",
    cmd    = "MyPlugInit",
    run    = ":TSUpdate",
    config = "require'plugins.configs.treesitter'",
  }

  -- TODO: consider nvim-ts-context-commentstring

  -- Autocompletion
  use {
    "williamboman/mason.nvim",
    commit = "41e75af",
    config = "require'plugins.configs.mason'",
  }

  use {
    "williamboman/mason-lspconfig.nvim",
    commit = "9453e3d",
    config = "require'plugins.configs.masonlspconfig'",
  }

  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
  }

  use {
    "lukas-reineke/cmp-under-comparator",
    commit = "6857f10",
  }

  use {
    "onsails/lspkind.nvim",
    -- commit = "57610d5",
    commit = "7a41b98",
  }

  use {
    "hrsh7th/nvim-cmp",
    commit   = "0b751f6",
    cmd      = "MyPlugInit",
    config   = "require'plugins.configs.cmp'",
    after    = { "cmp-under-comparator", "lspkind.nvim" },
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
    commit = "7de8a71",
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
    after   = { "nvim-cmp", "fuzzy.nvim" },
  }

  use {
    "tzachar/cmp-fuzzy-path",
    commit   = "0caa348",
    after   = { "nvim-cmp", "fuzzy.nvim" },
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
    commit = "6ef8c54",
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
    tag = "v4.8.1",
    cmd = "TableModeEnable",
  }

  use {
    "jbyuki/venn.nvim",
    commit = "e4d6834",
    cmd = "MyPlugInit",
  }

  use {
    "akinsho/toggleterm.nvim",
    commit = "6b334b9",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.toggleterm'",
  }

  -- Markdown preview
  use {
    "toppair/peek.nvim",
    commit = "4163a48",
    run    = "deno task --quiet build:fast",
    config = "require'plugins.configs.peek'",
  }

end)
