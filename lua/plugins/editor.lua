-- TODO: split by files

local function setup_autopairs()
  local npairs = require("nvim-autopairs")
  local rule   = require("nvim-autopairs.rule")

  npairs.setup({
    check_ts = true,
    enable_check_bracket_line = true,
    fast_wrap = {
      map = "<C-a>",
    },
  })

  npairs.add_rules {
    rule(" ", " ")
      :with_pair(function (opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({ "()", "[]", "{}" }, pair)
      end),
    rule("( ", " )")
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(")"),
    rule("{ ", " }")
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match(".%}") ~= nil
        end)
        :use_key("}"),
    rule("[ ", " ]")
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match(".%]") ~= nil
        end)
        :use_key("]")
  }
end

local function setup_scrollbar()
  require("scrollbar").setup({
    set_highlights = true,
    marks = {
      Cursor = {
        priority  = 10,
        text      = " ",
      },
      Search = {
        priority  = 1,
      },
      Error = {
        priority  = 2,
      },
      Warn = {
        priority  = 3,
      },
      Info = {
        priority  = 4,
      },
      Hint = {
        priority  = 5,
      },
      Misc = {
        priority  = 6,
      },
    },
    handlers = {
      diagnostic = true,
      search     = true,
      cursor     = true,
      handle     = true,
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
    },
  })

  local palette = vim.fn["my#get_palette"]()
  local cursor_color = palette["bg1"][1]
  local cursor_blend = 0

  vim.cmd(string.format("hi ScrollbarHandle guibg=%s blend=%s", cursor_color, cursor_blend))
  vim.cmd(string.format("hi ScrollbarCursorHandle guibg=%s blend=%s", cursor_color, cursor_blend))
  vim.cmd(string.format("hi ScrollbarSearchHandle guibg=%s blend=%s", cursor_color, cursor_blend))
  vim.cmd(string.format("hi ScrollbarErrorHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["red"][1], cursor_blend))
  vim.cmd(string.format("hi ScrollbarError guifg=%s", palette["red"][1]))
  vim.cmd(string.format("hi ScrollbarWarnHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["yellow"][1], cursor_blend))
  vim.cmd(string.format("hi ScrollbarWarn guifg=%s", palette["yellow"][1]))
  vim.cmd(string.format("hi ScrollbarInfoHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["green"][1], cursor_blend))
  vim.cmd(string.format("hi ScrollbarInfo guifg=%s", palette["green"][1]))
  vim.cmd(string.format("hi ScrollbarHintHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["aqua"][1], cursor_blend))
  vim.cmd(string.format("hi ScrollbarHint guifg=%s", palette["aqua"][1]))
  vim.cmd(string.format("hi ScrollbarMiscHandle guibg=%s guifg=%s blend=%s", cursor_color, palette["purple"][1], cursor_blend))
  vim.cmd(string.format("hi ScrollbarMisc guifg=%s", palette["purple"][1]))
end

return {
  {
    "vbogretsov/easyclip.vim",
    -- TODO: move to `keys` trigger
    event = "VimEnter",
  },
  {
    "tpope/vim-surround",
    tag   = "v2.2",
  },
  {
    "windwp/nvim-autopairs",
    commit  = "7470af8",
    event   = "InsertEnter",
    config  = setup_autopairs,
  },
  {
    "kevinhwang91/nvim-hlslens",
    commit = "5e3e908",
    config = true,
  },
  {
    "petertriho/nvim-scrollbar",
    commit  = "35f99d5",
    config  = setup_scrollbar,
  },
  {
    "norcalli/nvim-colorizer.lua",
    commit  = "36c610a",
    config  = function()
      require("colorizer").setup(
        {"*"},
        {
          RGB       = true,
          RRGGBB    = true,
          names     = true,
          RRGGBBAA  = true,
          rgb_fn    = true,
          hsl_fn    = true,
          css       = true,
          css_fn    = true,
      })
    end,
  }
}
