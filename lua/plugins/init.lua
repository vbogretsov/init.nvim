local present, packer = pcall(require, "plugins.setup")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

  -- this is arranged on the basis of when a plugin starts
  use {
    "wbthomason/packer.nvim",
  }

  -- this is the core repo containing utilities for some features like theme swticher, no need to lazy load
  use "nvim-lua/plenary.nvim"

  -- use "vbogretsov/everforest"
  use {
    "sainnhe/everforest",
    commit = "933f827",
  }

  -- Proper buffer deletion
  use {
    "famiu/bufdelete.nvim",
    commit = "46255e4",
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
    commit  = "3ef3382",
    config  = "require'plugins.configs.scrollbar'",
    cmd     = "MyPlugInit",
    requires = {
      "kevinhwang91/nvim-hlslens",
      commit = "1944094",
    },
  }

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "8d2c533",
    config = "require'plugins.configs.devicons'",
    cmd    = "MyPlugInit",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "5113cdb",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "nvim-web-devicons",
  }

  -- Buffer line
  use {
    "akinsho/bufferline.nvim",
    commit   = "68839d6",
    config   = "require'plugins.configs.bufferline'",
    requires = "kyazdani42/nvim-web-devicons",
    event    = "VimEnter",
  }

  -- File browser
  use {
    "kyazdani42/nvim-tree.lua",
    commit    = "7285898",
    cmd       = { "NvimTreeToggle", "NvimTreeFindFile" },
    config    = "require'plugins.configs.nvimtree'",
    requires  = "kyazdani42/nvim-web-devicons",
  }

  -- Color column
  use {
    "lukas-reineke/virt-column.nvim",
    tag    = "v1.5.3",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.colorcolumn'",
  }

  -- Indent balnk lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    tag    = "v2.19.1",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.indent'",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "4a95b39",
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
    commit = "533d768",
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
    commit   = "d5fee69",
    cmd      = "MyPlugInit",
    requires = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  }

  -- Navigation
  -- NOTE: Requires to be installed: `ripgrep`, `fd`
  use {
    "nvim-telescope/telescope.nvim",
    commit    = "d88b44d",
    cmd       = "Telescope",
    config    = "require'plugins.configs.telescope'",
    requires  = {
      "nvim-lua/plenary.nvim",
      {
         "nvim-telescope/telescope-fzf-native.nvim",
         commit = "6a33ece",
         run    = "make",
      },
      {
         "nvim-telescope/telescope-ui-select.nvim",
         commit = "62ea5e5",
      }
    },
  }

  -- Tree-Sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    -- commit = "b8fd5df",
    commit = "989c750",
    cmd    = "MyPlugInit",
    run    = ":TSUpdate",
    config = "require'plugins.configs.treesitter'",
  }

  use {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    commit   = "9897465",
    cmd      = "MyPlugInit",
    config   = "require'plugins.configs.cmp'",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "affe808",
    after  = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-vsnip",
    commit = "0abfa18",
    after  = "cmp-nvim-lsp",
  }

  use {
    "hrsh7th/vim-vsnip",
    commit = "8f199ef",
    after  = "cmp-vsnip",
  }

  use {
    "hrsh7th/cmp-path",
    commit = "981baf9",
    after  = "vim-vsnip",
  }

  use {
    "hrsh7th/cmp-buffer",
    commit = "62fc67a",
    after  = "cmp-path",
  }

  use {
    "hrsh7th/cmp-cmdline",
    commit = "c36ca4b",
    after  = "nvim-cmp"
  }

  use {
    "tzachar/cmp-fuzzy-buffer",
    commit  = "c00e590",
    after   = "nvim-cmp",
    requires = {"hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim"}
  }

  use {
    "tzachar/cmp-fuzzy-path",
    commit   = "8c1ecaa",
    after    = "nvim-cmp",
    requires = {"hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim"}
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    commit = "057ca6b",
    after  = "cmp-nvim-lsp",
    config = "require'plugins.configs.lspconfig'",
  }

  -- Remote containers
  use {
    "jamestthompson3/nvim-remote-containers",
    commit = "d635bea",
    cmd = "MyPlugInit",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    commit = "4883988",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.gitsigns'",
  }

  -- Outline
  use {
    "simrat39/symbols-outline.nvim",
    commit = "15ae99c",
    cmd    = "SymbolsOutline",
    setup  = "require'plugins.configs.outline'",
  }

  -- Terminal
  use {
    "akinsho/nvim-toggleterm.lua",
    commit = "4aa4f40",
    config = "require'plugins.configs.toggleterm'",
    keys   = "<c-\\>",
  }

  use {
    "dhruvasagar/vim-table-mode",
    tag = "v4.7.5",
    cmd = "TableModeEnable",
  }

  use {
    "gpanders/editorconfig.nvim",
    tag = "v1.3.0",
    cmd = "MyPlugInit",
  }

end)

