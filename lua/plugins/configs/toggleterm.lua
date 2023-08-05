local gui = vim.fn.exists("g:neovide") == 1

local palette = vim.fn["my#get_palette"]()

require("toggleterm").setup {
  size            = gui and 20 or 15,
  -- open_mapping    = [[<c-\>]],
  open_mapping    = [[`]],
  shade_filetypes = {},
  shade_terminals = false,
  start_in_insert = true,
  persist_size    = true,
  direction       = "float",
  -- direction       = "horizontal",
  -- direction       = gui and "horizontal" or "float",
  float_opts = {
    border = "single",
  },
  highlights = {
    FloatBorder = {
      guifg = palette["bg3"][1],
    },
  },
}

local Terminal  = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

local function lazygit_toggle()
  lazygit:toggle()
end

return {
  lazygit_toggle = lazygit_toggle,
}

