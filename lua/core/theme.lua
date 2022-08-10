vim.cmd[[hi clear SignColumn]]
vim.cmd[[hi clear VertSplit]]
vim.cmd[[hi CursorLineNr ctermfg=White guifg=White]]

vim.g.everforest_background = "soft"
vim.g.everforest_show_eob = 0
vim.g.everforest_better_performance = 1

vim.cmd[[colorscheme everforest]]

-- Disable outline highlight (option highlight_hovered_item doesn't work)
vim.cmd[[hi clear FocusedSymbol ]]
-- Temporary hack after update
vim.cmd[[hi clear Comment ]]
vim.cmd[[hi Comment guifg=#859289 ]]
