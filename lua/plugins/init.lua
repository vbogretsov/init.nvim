local present, packer = pcall(require, "plugins.setup")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

  -- this is arranged on the basis of when a plugin starts
  use {
    "wbthomason/packer.nvim",
    event = "VimEnter",
  }

  -- this is the core repo containing utilities for some features like theme swticher, no need to lazy load
  use "nvim-lua/plenary.nvim"

  use "vbogretsov/everforest"

  -- Proper buffer deletion
  use {
    "famiu/bufdelete.nvim",
    commit = "456a08f",
    event  = "VimEnter",
  }

   -- Clipboard
  use {
    "vbogretsov/easyclip.vim",
    event = "VimEnter",
  }

  -- Icons
  use {
    "kyazdani42/nvim-web-devicons",
    commit = "218658d",
    config = "require'plugins.configs.devicons'",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "3a17c8f",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "kyazdani42/nvim-web-devicons",
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
    commit    = "0aec64d",
    cmd       = { "NvimTreeToggle", "NvimTreeFindFile" },
    config    = "require'plugins.configs.nvimtree'",
    requires  = "kyazdani42/nvim-web-devicons",
  }

  -- Color column
  use {
    "lukas-reineke/virt-column.nvim",
    tag    = "v1.3.0",
    event  = "BufRead",
    config = "require'plugins.configs.colorcolumn'",
  }

  -- Indent balnk lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    tag    = "v2.11.0",
    event  = "BufRead",
    config = "require'plugins.configs.indent'",
  }

  -- Surround
  use {
    "tpope/vim-surround",
    tag   = "v2.2",
    event = "BufRead",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "04cd177",
    event   = "InsertEnter",
    config  = "require'plugins.configs.autopairs'",
  }

  -- Comments
  use {
    "b3nj5m1n/kommentary",
    commit = "2e1c3be",
    event  = "BufRead",
    config = "require'plugins.configs.kommentary'",
  }

  use {
    "norcalli/nvim-colorizer.lua",
    commit  = "36c610a",
    event   = "BufRead",
    config  = "require'plugins.configs.colorizer'",
  }

  -- Navigation
  -- NOTE: Requires to be installed: `ripgrep`, `fd`
  use {
    "nvim-telescope/telescope.nvim",
    commit    = "5f37fbf",
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
    event  = "BufRead",
    run    = ":TSUpdate",
    config = "require'plugins.configs.treesitter'",
  }

  use {
    "windwp/nvim-ts-autotag",
    after = 'nvim-treesitter',
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    commit   = "4efecf7",
    event    = "BufRead",
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
    commit = "e1a6916",
    after  = "vim-vsnip",
  }

  use {
    "hrsh7th/cmp-buffer",
    commit = "a0fe524",
    after  = "cmp-path",
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    commit = "0f72e54",
    after  = "cmp-nvim-lsp",
    config = "require'plugins.configs.lspconfig'",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    commit = "a451f97",
    event  = "BufReadPost",
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
