vim.cmd[[hi clear SignColumn]]
vim.cmd[[hi clear VertSplit]]

vim.g.everforest_background = "soft"
vim.g.everforest_show_eob = 0
vim.g.everforest_better_performance = 1

vim.fn["my#get_palette"] = function ()
  local background = vim.g.everforest_background
  local configuration = vim.fn["everforest#get_configuration"]()
  return vim.fn["everforest#get_palette"](background, configuration)
end

return {
  {
    "sainnhe/everforest",
    name     = "everforest",
    commit   = "9dbd4d1",
    lazy     = false,
    priority = 1000,

    config = function()
      vim.cmd[[colorscheme everforest]]
    end,
  },
}
