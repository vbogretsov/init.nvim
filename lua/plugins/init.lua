local present, packer = pcall(require, "plugins.setup")

if not present then
   return false
end

local use = packer.use

return packer.startup(function()

  local telescope_fzf_native = {
     "nvim-telescope/telescope-fzf-native.nvim",
     commit = "580b6c4",
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
    commit = "c68b3a0",
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
    commit = "8933abc",
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
    commit  = "f85b298",
    config  = "require'plugins.configs.scrollbar'",
    cmd     = "MyPlugInit",
    requires = {
      {
        "kevinhwang91/nvim-hlslens",
        commit = "fc83bd5",
        config = "require('hlslens').setup()",
      }
    },
  }

  -- Icons
  use {
    "nvim-tree/nvim-web-devicons",
    commit = "43aa2dd",
    config = "require'plugins.configs.devicons'",
    cmd    = "MyPlugInit",
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    commit    = "84ffb80",
    config    = "require'plugins.configs.lualine'",
    event     = "VimEnter",
    requires  = "nvim-web-devicons",
  }

  -- Buffer line
  use {
    "akinsho/bufferline.nvim",
    commit   = "ef4fdc5",
    config   = "require'plugins.configs.bufferline'",
    requires = "kyazdani42/nvim-web-devicons",
    event    = "VimEnter",
  }

  -- File browser
  use {
    "vbogretsov/neo-tree.nvim",
    commit    = "80dc74d",
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
    tag    = "v1.5.5",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.colorcolumn'",
  }

  -- Indent balnk lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    tag    = "v2.20.4",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.indent'",
    after  = "nvim-treesitter",
  }

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    commit  = "7470af8",
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
    commit    = "6258d50",
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
    -- commit = "fb36ed4",
    commit = "ac4020c",
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
    commit   = "777450f",
    cmd      = "MyPlugInit",
    config   = "require'plugins.configs.cmp'",
    requires  = {
      cmp_under_cursor,
      lspkind,
    }
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    commit = "0e6b2ed",
    after  = "nvim-cmp",
  }

  use {
    "hrsh7th/cmp-vsnip",
    commit = "989a8a7",
    after  = "cmp-nvim-lsp",
  }

  use {
    "hrsh7th/vim-vsnip",
    commit = "8dde8c0",
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
    commit  = "ada6352",
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
    commit = "372d5cb",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.gitsigns'",
  }

  use {
    "dhruvasagar/vim-table-mode",
    tag = "v4.7.6.1",
    cmd = "TableModeEnable",
  }

  use {
    "gpanders/editorconfig.nvim",
    commit = "5b9e303",
    cmd    = "MyPlugInit",
  }

  use {
    "jbyuki/venn.nvim",
    commit = "c114563",
    cmd = "MyPlugInit",
  }

  use {
    "akinsho/toggleterm.nvim",
    commit = "a54e6c4",
    cmd    = "MyPlugInit",
    config = "require'plugins.configs.toggleterm'",
  }

  -- Markdown preview
  use {
    "toppair/peek.nvim",
    commit = "571f14c",
    run    = "deno task --quiet build:fast",
    config = "require'plugins.configs.peek'",
  }

  use {
    "IndianBoy42/tree-sitter-just",
    after  = "nvim-treesitter",
    commit = "f807ab3",
    config = "require'plugins.configs.just'",
  }

end)

