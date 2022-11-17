local palette = vim.fn["my#get_palette"]()


return require("lualine").setup {
  options = {
    icons_enabled = true,
    theme         = "everforest",
    component_separators  = { left = "", right = "" },
    section_separators    = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = { "branch", {
      "diagnostics",
      sources   = { "nvim_diagnostic" },
      sections  = { "error", "warn", "info", "hint" },
      diagnostics_color = {
        error = { fg = palette["red"][1] },
        warn  = { fg = palette["yellow"][1] },
        info  = { fg = palette["green"][1] },
        hint  = { fg = palette["aqua"][1] },
      },
      symbols = { error = " ", warn = " ", info = " ", hint = "" },
    }},
    lualine_x = {
      "encoding",
      "fileformat",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    {
      sections = {
        lualine_a = { "filetype" },
      },
      filetypes = { "NvimTree", "Outline", "minimap" },
    },
  },
}
