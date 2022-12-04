local present, packer = pcall(require, "plugins.setup")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

  local telescope_fzf_native = {
     "nvim-telescope/telescope-fzf-native.nvim",
     commit = "8fff2b2",
     run    = "make",
  }

  local telescope_ui_select = {
    "nvim-telescope/telescope-ui-select.nvim",
    commit = "62ea5e5",
  }


  -- this is arranged on the basis of when a plugin starts
  use {
    "wbthomason/packer.nvim",
  }

  -- this is the core repo containing utilities for some features like theme swticher, no need to lazy load
  use "nvim-lua/plenary.nvim"

  use {
    "sainnhe/everforest",
    commit = "721c16b",
  }

  -- Proper buffer deletion
  use {
    "famiu/bufdelete.nvim",
    commit = "3ebf4a9",
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
    commit  = "2cb0a0b",
    config  = "require'plugins.configs.scrollbar'",
    cmd     = "MyPlugInit",
    requires = {
      "kevinhwang91/nvim-hlslens",
      commit = "aa6f885",
    },
  }

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "189ad37",
    config = "require'plugins.configs.devicons'",
    cmd    = "MyPlugInit",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "bfa0d99",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "nvim-web-devicons",
  }

  -- Buffer line
  use {
    "akinsho/bufferline.nvim",
    commit   = "4ecfa81",
    config   = "require'plugins.configs.bufferline'",
    requires = "kyazdani42/nvim-web-devicons",
    event    = "VimEnter",
  }

  -- File browser
  use {
    "nvim-neo-tree/neo-tree.nvim",
    commit    = "7c6903b",
    cmd       = "MyPlugInit",
    config    = "require'plugins.configs.neotree'",
    requires  = {
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
  }

  -- Color column
  use {
    "lukas-reineke/virt-column.nvim",
    tag    = "v1.5.4",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.colorcolumn'",
  }

  -- Indent balnk lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    tag    = "v2.20.2",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.indent'",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "99f6963",
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
    commit = "981d567",
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
    commit   = "04b3d96",
    cmd      = "MyPlugInit",
    requires = {
      telescope_fzf_native,
    },
  }

  -- Navigation
  -- NOTE: Requires to be installed: `ripgrep`, `fd`
  use {
    "nvim-telescope/telescope.nvim",
    commit    = "cabf991",
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
    -- commit = "4b90052",
    commit = "9bfd425",
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
    commit   = "93f385c",
    cmd      = "MyPlugInit",
    config   = "require'plugins.configs.cmp'",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "5922477",
    after  = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-vsnip",
    commit = "989a8a7",
    after  = "cmp-nvim-lsp",
  }

  use {
    "hrsh7th/vim-vsnip",
    commit = "e44026b",
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
    after  = "nvim-cmp"
  }

  use {
    "tzachar/cmp-fuzzy-buffer",
    commit  = "471949d",
    after   = "nvim-cmp",
    requires = {"hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim"}
  }

  use {
    "tzachar/cmp-fuzzy-path",
    commit   = "28735ce",
    after    = "nvim-cmp",
    requires = {"hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim"}
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    commit = "ac132be",
    after  = "cmp-nvim-lsp",
    config = "require'plugins.configs.lspconfig'",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    commit = "d076301",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.gitsigns'",
  }

  -- Outline
  -- use {
  --   "simrat39/symbols-outline.nvim",
  --   commit = "6a3ed24",
  --   cmd    = "SymbolsOutline",
  --   setup  = "require'plugins.configs.outline'",
  -- }

  use {
    "akinsho/toggleterm.nvim",
    commit = "3ba6838",
    config = "require'plugins.configs.toggleterm'",
    keys   = "<c-\\>",
  }

  use {
    "dhruvasagar/vim-table-mode",
    tag = "v4.7.6.1",
    cmd = "TableModeEnable",
  }

  use {
    "gpanders/editorconfig.nvim",
    commit = "2af8809",
    cmd    = "MyPlugInit",
  }

  -- use {
  --   "jbyuki/venn.nvim",
  --   commit = "71856b5",
  --   cmd = "MyPlugInit",
  -- }

end)

