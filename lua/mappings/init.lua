-- Abbreviations
vim.cmd[[cab Q qa]]
vim.cmd[[cab W w]]
vim.cmd[[cab Wq wq]]

-- Leader
vim.g.mapleader = ","

vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true })
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "q", "<ESC>", { noremap = true })

-- TASKS
vim.api.nvim_set_keymap("n", "TN", "i<C-k>OS", { noremap = true })
vim.api.nvim_set_keymap("n", "TD", "r<C-k>OK", { noremap = true })
vim.api.nvim_set_keymap("n", "TC", "r<C-k>XX", { noremap = true })

-- Trim trailing whitespaces
vim.api.nvim_set_keymap("n", "<leader>x", ":%s/\\s\\+$//<CR>", { noremap = true })

vim.api.nvim_set_keymap("i", "<CR>", "<CR>", {})

-- Window resize
vim.api.nvim_set_keymap("n", "∆", ":resize -2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "˚", ":resize +2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "˙", ":vertical resize -2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "¬", ":vertical resize +2<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })

-- noremap <C-w>z <C-w>\|<C-w>\_
-- vim.api.nvim_set_keymap("n", "<C-w>o", "<C-w>\\|<C-w>\\_", { noremap = true, silent = false })

-- Buffers
vim.api.nvim_set_keymap("n", "<leader>w", ":Bdelete<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>W", ":Bdelete!<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = false })

-- Move selected lines up/down
vim.api.nvim_set_keymap("x", "K", ":move -2<CR>gv-gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "J", ":move +1<CR>gv-gv", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "U", "<C-u>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "D", "<C-d>", { noremap = true, silent = true })

-- Clipboard
vim.api.nvim_set_keymap("v", "y", "y:call ClipboardYank()<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "d", "d:call ClipboardYank()<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "x", "x:call ClipboardYank()<CR>", { silent = true })
vim.api.nvim_set_keymap("v", "p", "p:call ClipboardPaste()<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "p", "p:call ClipboardPaste()<CR>", { silent = true })

vim.api.nvim_set_keymap("i", "<D-v>", '<esc>"*pa', { silent = true })
vim.api.nvim_set_keymap("n", "<D-v>", '"*p', { silent = true })

-- File tree
-- vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>NvimTreeToggle<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>;", "<cmd>NvimTreeFindFile<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>Neotree toggle current<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>Neotree left<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>l", "<cmd>Neotree current reveal<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>Neotree current<CR>", { noremap = true })

-- Focus window
-- vim.api.nvim_set_keymap("n", "<leader>h", ":FocusSplitLeft<CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>j", ":FocusSplitDown<CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>k", ":FocusSplitUp<CR>", { silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>l", ":FocusSplitRight<CR>", { silent = true })

-- Navigation
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope find_files<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>Telescope help_tags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "F", "<cmd>Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "T", "<cmd>Telescope grep_string only_sort_text=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>Telescope lsp_definitions<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>Telescope lsp_type_definitions<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>Telescope lsp_references<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>Telescope lsp_implementations<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>[", "<cmd>Telescope lsp_document_symbols<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>]", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ed", "<cmd>Telescope diagnostics bufnr=0<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ee", "<cmd>Telescope diagnostics<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { noremap = true })

-- LSP
vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>mv", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })

-- Comments
vim.api.nvim_set_keymap("n", "<leader>c", "<Plug>kommentary_line_default<ESC>", {})
vim.api.nvim_set_keymap("v", "<leader>c", "<Plug>kommentary_visual_default<ESC>", {})

-- Outline
-- vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", { noremap = true })

-- Search
vim.api.nvim_set_keymap("n", "n",
  [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N",
  [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
  { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })


-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
-- vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})
