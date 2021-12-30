require("toggleterm").setup {
  size            = 15,
  open_mapping    = [[<c-\>]],
  shade_filetypes = {},
  shade_terminals = false,
  start_in_insert = true,
  persist_size    = true,
  direction       = "float",
  float_opts = {
    border = "single",
    highlights = {
      border = "Normal",
    },
  },
}

local Terminal  = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function lazygit_toggle()
  lazygit:toggle()
end

return {
  lazygit_toggle = lazygit_toggle,
}

