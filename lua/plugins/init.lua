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

  use "vbogretsov/everforest"

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

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "ac71ca8",
    config = "require'plugins.configs.devicons'",
    cmd    = "MyPlugInit",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "9e26823",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "nvim-web-devicons",
  }

  -- Buffer line
  use {
    "akinsho/bufferline.nvim",
    commit   = "de66766",
    config   = "require'plugins.configs.bufferline'",
    requires = "kyazdani42/nvim-web-devicons",
    event    = "VimEnter",
  }

  -- File browser
  use {
    "kyazdani42/nvim-tree.lua",
    commit    = "0a2f6b0",
    cmd       = { "NvimTreeToggle", "NvimTreeFindFile" },
    config    = "require'plugins.configs.nvimtree'",
    requires  = "kyazdani42/nvim-web-devicons",
  }

  -- Color column
  use {
    "lukas-reineke/virt-column.nvim",
    tag    = "v1.3.0",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.colorcolumn'",
  }

  -- Indent balnk lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    tag    = "v2.11.0",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.indent'",
  }

  -- Surround
  use {
    "tpope/vim-surround",
    tag   = "v2.2",
    cmd   = "MyPlugInit",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "5348e4a",
    event   = "InsertEnter",
    config  = "require'plugins.configs.autopairs'",
  }

  -- Comments
  use {
    "b3nj5m1n/kommentary",
    commit = "2e1c3be",
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
    commit    = "1d1da66",
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
    commit   = "eca04af",
    cmd      = "MyPlugInit",
    config   = "require'plugins.configs.cmp'",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "1341172",
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
    commit = "4d58224",
    after  = "vim-vsnip",
  }

  use {
    "hrsh7th/cmp-buffer",
    commit = "a01cfec",
    after  = "cmp-path",
  }

  use {
    "hrsh7th/cmp-cmdline",
    commit = "29ca81a",
    after  = "nvim-cmp"
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    commit = "b01c0d0",
    after  = "cmp-nvim-lsp",
    config = "require'plugins.configs.lspconfig'",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    commit = "c18fc65",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.gitsigns'",
  }

  -- Outline
  use {
    "simrat39/symbols-outline.nvim",
    commit = "0347928",
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
  --   "dhruvasagar/vim-table-mode",
  --   tag = "v4.7.5",
  --   cmd = "???",
  -- }

end)

