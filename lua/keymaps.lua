function ClipboardYank()
  local content = vim.fn.getreg("")
  vim.fn.system("pbcopy", content)
end

function ClipboardPaste()
  local content = vim.fn.system("pbpaste")
  vim.fn.setreg("", content)
end

-- Abbreviations
vim.cmd([[cab Q qa]])
vim.cmd([[cab W w]])
vim.cmd([[cab Wq wq]])

-- Leader
vim.g.mapleader = ","

vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "q", "<ESC>", { noremap = true })

-- Trim trailing whitespaces
vim.api.nvim_set_keymap(
  "n",
  "<leader>x",
  ":%s/\\s\\+$//<CR>",
  { noremap = true }
)

-- I don't remember why I added this
vim.api.nvim_set_keymap("i", "<CR>", "<CR>", {})

-- Clipboard
vim.api.nvim_set_keymap(
  "v",
  "y",
  "y:lua ClipboardYank()<CR>",
  { silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "d",
  "d:lua ClipboardYank()<CR>",
  { silent = true }
)
vim.api.nvim_set_keymap(
  "v",
  "x",
  "x:lua ClipboardYank()<CR>",
  { silent = true }
)

-- Move selected lines left/right
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = false })

-- Move selected lines up/down
vim.api.nvim_set_keymap(
  "x",
  "K",
  ":move -2<CR>gv-gv",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "x",
  "J",
  ":move +1<CR>gv-gv",
  { noremap = true, silent = true }
)

-- Window resize
vim.api.nvim_set_keymap(
  "n",
  "∆",
  ":resize -2<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "˚",
  ":resize +2<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "˙",
  ":vertical resize -2<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "¬",
  ":vertical resize +2<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-h>",
  "<C-w>h",
  { noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-j>",
  "<C-w>j",
  { noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-k>",
  "<C-w>k",
  { noremap = true, silent = false }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-l>",
  "<C-w>l",
  { noremap = true, silent = false }
)

-- noremap <C-w>z <C-w>\|<C-w>\_
-- vim.api.nvim_set_keymap("n", "<C-w>o", "<C-w>\\|<C-w>\\_", { noremap = true, silent = false })

-- Buffers
vim.api.nvim_set_keymap(
  "n",
  "<leader>w",
  ":Bdelete<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>W",
  ":Bdelete!<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<Tab>",
  ":BufferLineCycleNext<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<S-Tab>",
  ":BufferLineCyclePrev<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>1",
  ":BufferLineGoToBuffer 1<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>2",
  ":BufferLineGoToBuffer 2<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>3",
  ":BufferLineGoToBuffer 3<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>4",
  ":BufferLineGoToBuffer 4<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>5",
  ":BufferLineGoToBuffer 5<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>6",
  ":BufferLineGoToBuffer 6<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>7",
  ":BufferLineGoToBuffer 7<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>8",
  ":BufferLineGoToBuffer 8<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>9",
  ":BufferLineGoToBuffer 9<CR>",
  { noremap = true, silent = true }
)

-- Comments
vim.api.nvim_set_keymap(
  "n",
  "<leader>c",
  "<Plug>kommentary_line_default<ESC>",
  {}
)
vim.api.nvim_set_keymap(
  "v",
  "<leader>c",
  "<Plug>kommentary_visual_default",
  {}
)

-- File Explorer
vim.api.nvim_set_keymap(
  "n",
  "<leader>l",
  "<cmd>DrexDrawerLocate<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>d",
  "<cmd>Drex<CR>",
  { noremap = true }
)

-- LSP
vim.api.nvim_set_keymap(
  "n",
  "K",
  "<cmd>lua vim.lsp.buf.hover()<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>mv",
  "<cmd>lua vim.lsp.buf.rename()<CR>",
  { noremap = true, silent = true }
)

-- Telescope
vim.api.nvim_set_keymap(
  "n",
  "<leader>fa",
  "<cmd>lua vim.lsp.buf.code_action()<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fh",
  "<cmd>Telescope help_tags<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "fg",
  "<cmd>Telescope live_grep<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "T",
  "<cmd>Telescope grep_string only_sort_text=true<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fd",
  "<cmd>Telescope lsp_definitions<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ft",
  "<cmd>Telescope lsp_type_definitions<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fr",
  "<cmd>Telescope lsp_references<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fi",
  "<cmd>Telescope lsp_implementations<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fj",
  "<cmd>Telescope jumplist<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fs",
  "<cmd>Telescope lsp_document_symbols<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>fS",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>eb",
  "<cmd>Telescope diagnostics bufnr=0<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ew",
  "<cmd>Telescope diagnostics<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gc",
  "<cmd>Telescope git_commits<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gb",
  "<cmd>Telescope git_commits<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gB",
  "<cmd>Telescope git_branches<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>gs",
  "<cmd>Telescope git_status<CR>",
  { noremap = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>t",
  "<cmd>Telescope treesitter<CR>",
  { noremap = true }
)

-- Search
vim.api.nvim_set_keymap(
  "n",
  "n",
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "N",
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "*",
  [[*<Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "#",
  [[#<Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "g*",
  [[g*<Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "g#",
  [[g#<Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true }
)

-- Markdown
--
vim.api.nvim_set_keymap(
  "n",
  "<leader>m",
  [[<Cmd>TableModeEa<CR>]],
  { noremap = true, silent = true }
)
