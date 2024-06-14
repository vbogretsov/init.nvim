-- TODO: split by files

local function setup_autopairs()
  local npairs = require("nvim-autopairs")
  local rule = require("nvim-autopairs.rule")

  npairs.setup({
    check_ts = true,
    enable_check_bracket_line = true,
    fast_wrap = {
      map = "<C-a>",
    },
  })

  npairs.add_rules({
    rule(" ", " "):with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ "()", "[]", "{}" }, pair)
    end),
    rule("( ", " )")
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match(".%)") ~= nil
      end)
      :use_key(")"),
    rule("{ ", " }")
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match(".%}") ~= nil
      end)
      :use_key("}"),
    rule("[ ", " ]")
      :with_pair(function()
        return false
      end)
      :with_move(function(opts)
        return opts.prev_char:match(".%]") ~= nil
      end)
      :use_key("]"),
  })
end

local function setup_scrollbar()
  require("scrollbar").setup({
    set_highlights = true,
    marks = {
      Cursor = {
        priority = 10,
        text = " ",
      },
      Search = {
        priority = 1,
      },
      Error = {
        priority = 2,
      },
      Warn = {
        priority = 3,
      },
      Info = {
        priority = 4,
      },
      Hint = {
        priority = 5,
      },
      Misc = {
        priority = 6,
      },
    },
    handlers = {
      diagnostic = true,
      search = true,
      cursor = true,
      handle = true,
    },
    excluded_buftypes = {
      "terminal",
      "TelescopePrompt",
      "TelescopeResults",
      "packer",
      "lspsaga",
    },
    excluded_filetypes = {
      "packer",
      "lspsaga",
      "cmp_menu",
      "prompt",
      "TelescopePrompt",
      "TelescopeResults",
      "noice",
      "neo-tree",
      "lazy",
      "mason",
    },
  })

  local colors = vim.g.colorscheme_get_palette()
  local hl = vim.g.colorscheme_highlight

  hl("ScrollbarError", colors.red, colors.bg0)
  hl("ScrollbarErrorHandle", colors.red, colors.bg1)
  hl("ScrollbarWarn", colors.yellow, colors.bg0)
  hl("ScrollbarWarnHandle", colors.yellow, colors.bg1)
  hl("ScrollbarInfo", colors.green, colors.bg0)
  hl("ScrollbarInfoHandle", colors.green, colors.bg1)
  hl("ScrollbarMisc", colors.purple, colors.bg0)
  hl("ScrollbarMiscHandle", colors.purple, colors.bg1)
end

return {
  {
    "vbogretsov/easyclip.vim",
    -- TODO: move to `keys` trigger
    event = { "BufAdd", "BufReadPost" },
  },
  {
    "tpope/vim-surround",
    tag = "v2.2",
    -- TODO: init on keys
    event = { "BufAdd", "BufReadPost" },
  },
  {
    "windwp/nvim-autopairs",
    commit = "7470af8",
    event = "InsertEnter",
    config = setup_autopairs,
  },
  {
    "kevinhwang91/nvim-hlslens",
    commit = "5e3e908",
    config = true,
    event = "BufRead",
  },
  {
    "petertriho/nvim-scrollbar",
    commit = "35f99d5",
    config = setup_scrollbar,
    event = "BufRead",
  },
  {
    "norcalli/nvim-colorizer.lua",
    commit = "36c610a",
    event = { "BufAdd", "BufReadPost" },
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
      })
    end,
  },
}
