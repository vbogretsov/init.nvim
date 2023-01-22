local gui = vim.fn.exists("g:neovide") == 1


require("toggleterm").setup {
  size            = gui and 20 or 15,
  open_mapping    = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = false,
  start_in_insert = true,
  persist_size    = true,
  -- direction       = "float",
  -- direction       = "horizontal",
  direction       = gui and "horizontal" or "float",
  float_opts = {
    border = "single",
    highlights = {
      border = "Normal",
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

