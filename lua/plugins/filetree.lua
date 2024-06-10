-- TODO: refactor

local function on_enter()
  vim.cmd[[setlocal nobuflisted]]
  vim.cmd[[setlocal nolist]]
end

local function get_buf_names()
  local bufnames = {}
  for _, v in pairs(vim.api.nvim_list_bufs()) do
    bufnames[vim.api.nvim_buf_get_name(v)] = v
  end
  return bufnames
end

local function confirm_delete()
  return vim.fn.input("Confirm delete (y/n): ") == "y"
end

local function delete_single()
  if not confirm_delete() then
    return
  end
  local utils = require("drex.utils")
  local line = vim.api.nvim_get_current_line()
  local bufs = get_buf_names()
  local bufnr = bufs[utils.get_element(line)]
  if bufnr ~= nil then
    vim.fn.execute(":Bdelete " .. bufnr)
  end
  require("drex.actions.files").delete("line")
end

local function delete_selected()
  if not confirm_delete() then
    return
  end
  local utils = require("drex.utils")
  local bufs = get_buf_names()
  local l_start, l_end = utils.get_visual_selection()
  for n = l_start, l_end, 1 do
    local line = vim.fn.getline(n)
    local bufnr = bufs[utils.get_element(line)]
    if bufnr ~= nil then
      vim.fn.execute(":Bdelete " .. bufnr)
    end
  end
  require("drex.actions.files").delete("visual")
end

local function delete_clipboard()
  if not confirm_delete() then
    return
  end
  local clipboard = require('drex.clipboard')
  local utils = require("drex.utils")
  local bufs = get_buf_names()
  local elements = clipboard.get_clipboard_entries('asc')
  for i, line in ipairs(elements) do
    local bufnr = bufs[line]
    if bufnr ~= nil then
      vim.fn.execute(":Bdelete " .. bufnr)
    end
  end
  require("drex.actions.files").delete("clipboard")
end

local function create()
  local utils = require("drex.utils")
  local line = vim.api.nvim_get_current_line()
  local path
  if utils.is_open_directory(line) then
    path = utils.get_element(line) .. utils.path_separator
  else
    path = utils.get_path(line)
  end
  require("drex.actions.files").create(path)
end

local function toggle_element()
  local elements = require('drex.elements')
  local line = vim.api.nvim_get_current_line()
  if require('drex.utils').is_open_directory(line) then
    elements.collapse_directory()
  else
    elements.expand_element()
  end
end

local function locate()
  pcall(require('drex.drawer').find_element, '%', true, true)
end

local function autoclose()
  if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("drex://") ~= nil then
    vim.cmd[[quit]]
  end
end

vim.api.nvim_create_user_command("DrexDrawerLocate", locate, {
  desc = "Jump to the current file in the DREX drawer window and focus it",
})

vim.api.nvim_create_autocmd("WinEnter", { callback = autoclose })

local opts = {
  hijack_netrw = true,
  icons = {
    file_default = "",
    dir_open = "",
    dir_closed = "",
    link = "",
    others = "",
  },
  drawer = {
    side = 'left',
    default_width = 42,
    window_picker = {
      enabled = true,
      labels = 'abcdefghijklmnopqrstuvwxyz',
    },
  },
  disable_default_keybindings = true,
  keybindings = {
    ['n'] = {
      ['v'] = 'V',
      ['o'] = { '<cmd>lua require("drex.elements").expand_element()<CR>', { desc = 'expand element' }},
      ['O'] = { '<cmd>lua require("drex.elements").collapse_directory()<CR>', { desc = 'collapse directory' }},
      ['R'] = { '<cmd>lua require("drex").reload_directory()<CR>', { desc = 'reload' }},
      ['gj'] = { '<cmd>lua require("drex.actions.jump").jump_to_next_sibling()<CR>', { desc = 'jump to next sibling' }},
      ['gk'] = { '<cmd>lua require("drex.actions.jump").jump_to_prev_sibling()<CR>', { desc = 'jump to prev sibling' }},
      ['gh'] = { '<cmd>lua require("drex.actions.jump").jump_to_parent()<CR>', { desc = 'jump to parent element' }},
      ['s'] = { '<cmd>lua require("drex.actions.stats").stats()<CR>', { desc = 'show element stats' }},
      ['a'] = { create, { desc = 'create element' }},
      ['d'] = { delete_single, { desc = 'delete element' }},
      ['D'] = { delete_clipboard, { desc = 'delete (clipboard)' }},
      ['p'] = { '<cmd>lua require("drex.actions.files").copy_and_paste()<CR>', { desc = 'copy & paste (clipboard)' }},
      ['P'] = { '<cmd>lua require("drex.actions.files").cut_and_move()<CR>', { desc = 'cut & move (clipboard)' }},
      ['r'] = { '<cmd>lua require("drex.actions.files").rename()<CR>', { desc = 'rename element' }},
      ['/'] = { '<cmd>keepalt lua require("drex.actions.search").search()<CR>', { desc = 'search' }},
      ['m'] = { '<cmd>DrexToggle<CR>', { desc = 'toggle element' }},
      ['cc'] = { '<cmd>lua require("drex.clipboard").clear_clipboard()<CR>', { desc = 'clear clipboard' }},
      ['cs'] = { '<cmd>lua require("drex.clipboard").open_clipboard_window()<CR>', { desc = 'edit clipboard' }},
      ['y'] = { '<cmd>lua require("drex.actions.text").copy_name()<CR>', { desc = 'copy element name' }},
      ['Y'] = { '<cmd>lua require("drex.actions.text").copy_relative_path()<CR>', { desc = 'copy element relative path' }},
      ['<C-y>'] = { '<cmd>lua require("drex.actions.text").copy_absolute_path()<CR>', { desc = 'copy element absolute path' }},
      ['<C-w>'] = { '', {}},
      ['<Tab>'] = toggle_element,
      ['q'] = { ':DrexDrawerClose<CR>', { desc = 'close side tree view' } },
    },
    ['v'] = {
      ['d'] = { delete_selected, { desc = 'delete elements' }},
      ['r'] = { ':lua require("drex.actions.files").multi_rename("visual")<CR>', { desc = 'rename elements' }},
      ['M'] = { ':DrexMark<CR>', { desc = 'mark elements' }},
      ['u'] = { ':DrexUnmark<CR>', { desc = 'unmark elements' }},
      ['m'] = { ':DrexToggle<CR>', { desc = 'toggle elements' }},
      ['y'] = { ':lua require("drex.actions.text").copy_name(true)<CR>', { desc = 'copy element names' }},
      ['Y'] = { ':lua require("drex.actions.text").copy_relative_path(true)<CR>', { desc = 'copy element relative paths' }},
      ['<C-y>'] = { ':lua require("drex.actions.text").copy_absolute_path(true)<CR>', { desc = 'copy element absolute paths' }},
    },
  },
  on_enter = on_enter,
}

return {
  {
    "vbogretsov/drex.nvim",
    commit = "c623371",
    lazy   = true,
    cmd    = {
      "Drex",
      "DrexToggle",
      "DrexDrawerToggle",
    },
    config = function()
      require("drex.config").configure(opts)
    end,
  },
}
