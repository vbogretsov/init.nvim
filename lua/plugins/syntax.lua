local opts = {
  ensure_installed = "all",
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  ignore_install = { "t32", "ipkg" },
  indent = {
    enable = true,
    disable = {
      "yaml",
      "c",
      "go",
    },
  },
  autotag = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["mf"] = "@function.outer",
        ["mc"] = "@class.outer",
        ["mb"] = "@block.outer",
      },
      goto_next_end = {
        [''] = '@function.outer',
      },
      goto_previous_start = {
        ["mF"] = "@function.outer",
        ["mC"] = "@class.outer",
      },
      goto_previous_end = {
        [''] = '@function.outer',
      },
    },
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "42fc28b",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- TODO: Configure textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "0f051e9",
    event = "VeryLazy",
  },
  {
    "windwp/nvim-ts-autotag",
    commit = "a1d526a",
    event = "InsertEnter",
  },
}
