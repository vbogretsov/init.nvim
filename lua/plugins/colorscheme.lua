vim.cmd([[hi clear SignColumn]])
vim.cmd([[hi clear VertSplit]])

vim.g.everforest_background = "soft"
vim.g.everforest_show_eob = 0
vim.g.everforest_better_performance = 1

local function get_palette()
  local background = vim.g.everforest_background
  local configuration = vim.fn["everforest#get_configuration"]()
  return vim.fn["everforest#get_palette"](background, configuration)
end

vim.g.colorscheme_get_palette = get_palette
vim.g.colorscheme_highlight = vim.fn["everforest#highlight"]

return {
  {
    "sainnhe/everforest",
    name = "everforest",
    -- commit   = "9dbd4d1",
    commit = "3e5ec25",
    lazy = false,
    priority = 1000,

    config = function()
      vim.cmd([[colorscheme everforest]])
      vim.fn.sign_define(
        "DiagnosticSignError",
        { text = " ", texthl = "DiagnosticSignError" }
      )
      vim.fn.sign_define(
        "DiagnosticSignWarn",
        { text = " ", texthl = "DiagnosticSignWarn" }
      )
      vim.fn.sign_define(
        "DiagnosticSignInfo",
        { text = " ", texthl = "DiagnosticSignInfo" }
      )
      vim.fn.sign_define(
        "DiagnosticSignHint",
        { text = "", texthl = "DiagnosticSignHint" }
      )
    end,
  },
}
