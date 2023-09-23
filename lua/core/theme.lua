vim.cmd[[hi clear SignColumn]]
vim.cmd[[hi clear VertSplit]]
vim.cmd[[hi CursorLineNr ctermfg=White guifg=White]]

vim.g.everforest_background = "soft"
vim.g.everforest_show_eob = 0
vim.g.everforest_better_performance = 1

if vim.fn.exists("g:neovide") then
  vim.g.everforest_transparent_background = 0
else
  vim.g.everforest_transparent_background = 1
end

vim.cmd[[colorscheme everforest]]

-- Disable outline highlight (option highlight_hovered_item doesn't work)
vim.cmd[[hi clear FocusedSymbol ]]
-- Temporary hack after update
vim.cmd[[hi clear Comment ]]

vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

vim.fn["my#get_palette"] = function ()
  local background = vim.g.everforest_background
  local configuration = vim.fn["everforest#get_configuration"]()
  return vim.fn["everforest#get_palette"](background, configuration)
end

local palette = vim.fn["my#get_palette"]()
vim.cmd([[hi Comment guifg=]] .. palette["grey1"][1])
vim.cmd([[hi DiagnosticSignError guifg=]] .. palette["red"][1])
vim.cmd([[hi DiagnosticSignWarn guifg=]] .. palette["yellow"][1])
vim.cmd([[hi DiagnosticSignInfo guifg=]] .. palette["green"][1])
vim.cmd([[hi DiagnosticSignHint guifg=]] .. palette["aqua"][1])
