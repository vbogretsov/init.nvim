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
    commit = "759c53d",
  }

  -- Proper buffer deletion
  use {
    "famiu/bufdelete.nvim",
    commit = "1c59b78",
    cmd    = "MyPlugInit",
  }

   -- Clipboard
  use {
    "vbogretsov/easyclip.vim",
    cmd = "MyPlugInit",
  }

  use {
    "petertriho/nvim-scrollbar",
    commit  = "b10ece8",
    config  = "require'plugins.configs.scrollbar'",
    cmd     = "MyPlugInit",
  }

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "4415d1a",
    config = "require'plugins.configs.devicons'",
    cmd    = "MyPlugInit",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "d2e0ac5",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "nvim-web-devicons",
  }

  -- Buffer line
  use {
    "akinsho/bufferline.nvim",
    commit   = "871495d",
    config   = "require'plugins.configs.bufferline'",
    requires = "kyazdani42/nvim-web-devicons",
    event    = "VimEnter",
  }

  -- File browser
  use {
    "kyazdani42/nvim-tree.lua",
    commit    = "19075f4",
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
    tag    = "v2.12.1",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.indent'",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "d2cde7c",
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
    commit = "12ecde4",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.kommentary'",
  }

  use {
    "norcalli/nvim-colorizer.lua",
    commit  = "36c610a",
    cmd     = "MyPlugInit",
    config  = "require'plugins.configs.colorizer'",
  }

  -- Navigation
  -- NOTE: Requires to be installed: `ripgrep`, `fd`
  use {
    "nvim-telescope/telescope.nvim",
    commit    = "b501d9e",
    cmd       = "Telescope",
    config    = "require'plugins.configs.telescope'",
    requires  = {
      "nvim-lua/plenary.nvim",
      {
         "nvim-telescope/telescope-fzf-native.nvim",
         commit = "b8662b0",
         run    = "make",
      },
    },
  }

  -- Tree-Sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    -- commit = "f7e9caa",
    commit = "cada76c",
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
    commit   = "1001683",
    cmd      = "MyPlugInit",
    config   = "require'plugins.configs.cmp'",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "ebdfc20",
    after  = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-vsnip",
    commit = "0abfa18",
    after  = "cmp-nvim-lsp",
  }

  use {
    "hrsh7th/vim-vsnip",
    commit = "fd13f3f",
    after  = "cmp-vsnip",
  }

  use {
    "hrsh7th/cmp-path",
    commit = "466b6b8",
    after  = "vim-vsnip",
  }

  use {
    "hrsh7th/cmp-buffer",
    commit = "d66c4c2",
    after  = "cmp-path",
  }

  use {
    "hrsh7th/cmp-cmdline",
    commit = "f4beb74",
    after  = "nvim-cmp"
  }

  use {
    "tzachar/cmp-fuzzy-buffer",
    commit = "c00e590",
    after  = "nvim-cmp",
  }

  use {
    "tzachar/cmp-fuzzy-path",
    commit = "0c214af",
    after  = "nvim-cmp",
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    commit = "cf2fc1d",
    after  = "cmp-nvim-lsp",
    config = "require'plugins.configs.lspconfig'",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    commit = "779f4eb",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.gitsigns'",
  }

  -- Outline
  use {
    "simrat39/symbols-outline.nvim",
    commit = "1361738",
    cmd    = "SymbolsOutline",
    setup  = "require'plugins.configs.outline'",
  }

  -- Terminal
  use {
    "akinsho/nvim-toggleterm.lua",
    commit = "265bbff",
    config = "require'plugins.configs.toggleterm'",
    keys   = "<c-\\>",
  }

  -- use {
  --   "abecodes/tabout.nvim",
  --   commit = "6ff556b",
  --   config = "require('tabout').setup()",
  --   cmd    = "MyPlugInit",
  --   wants  = "nvim-treesitter",
  -- }

  -- use {
  --   "dhruvasagar/vim-table-mode",
  --   tag = "v4.7.5",
  --   cmd = "TableModeEnable",
  -- }

  use {
    "gpanders/editorconfig.nvim",
    tag = "v1.3.0",
    cmd = "MyPlugInit",
  }

end)

