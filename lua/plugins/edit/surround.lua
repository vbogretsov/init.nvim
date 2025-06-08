local M = {}

local function setup()
  require("nvim-surround").setup({})

  -- local config = require("nvim-surround.config")
  -- local visual_surround = require("nvim-surround").visual_surround

  -- M.visual_surround = function(args)
  --   local old_pos = { vim.fn.getpos("'<"), vim.fn.getpos("'>") }
  --   -- Adjust positions if needed
  --   -- old_pos[1][3] = old_pos[1][3] + 2  -- Move start position right by 2 chars
  --   old_pos[2][3] = old_pos[2][3] + 3  -- Move end position right by 2 chars

  --   visual_surround(args)
    
  --   -- Set new visual selection
  --   vim.fn.setpos("'<", old_pos[1])
  --   vim.fn.setpos("'>", old_pos[2])
  --   vim.cmd("normal! gv")  -- Restore visual mode with new selection
  -- end

  -- config.set_keymap({
  --   mode = "x",
  --   lhs = "<Plug>(nvim-surround-visual)",
  --   rhs = function()
  --       local curpos = require("nvim-surround.buffer").get_curpos()
  --       return string.format(
  --           ":lua require'plugins.edit.surround'.visual_surround({ line_mode = false, curpos = { %d, %d }, curswant = %d })<CR>",
  --           curpos[1],
  --           curpos[2],
  --           vim.fn.winsaveview().curswant
  --       )
  --   end,
  --   opts = {
  --       buffer = false,
  --       desc = "Add a surrounding pair around a visual selection",
  --       silent = true,
  --       expr = true,
  --   },
  -- })
end

M.setup = setup
return M