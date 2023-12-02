local tabsize = 4

vim.cmd[[filetype on]]
vim.cmd[[filetype plugin indent on]]
vim.o.background        = "dark"
vim.o.shortmess         = 'atIW'
vim.o.hidden            = true
vim.o.whichwrap         = "b,s,<,>,[,],h,l"
vim.o.pumheight         = 16
vim.o.fileencoding      = "utf-8"
vim.o.cmdheight         = 1
vim.o.splitbelow        = true
vim.o.termguicolors     = true
vim.o.splitright        = true
vim.o.conceallevel      = 0
vim.o.showtabline       = 0
vim.o.showmode          = false
vim.o.showcmd           = false
vim.o.backup            = false
vim.o.writebackup       = false
vim.o.updatetime        = 300
vim.o.errorbells        = false
vim.o.belloff           = "all"
vim.o.hlsearch          = true
vim.o.ignorecase        = true
vim.o.scrolloff         = 4
vim.o.sidescrolloff     = 4
vim.o.mouse             = "a"
vim.o.wildmenu          = true
vim.o.fillchars         = vim.o.fillchars .. "vert:│" .. ",eob: "
vim.o.list              = true
vim.o.listchars         = "tab:▸ ,trail:·,space:·"
vim.o.lazyredraw        = true
vim.o.re                = 1
vim.o.synmaxcol         = 180
vim.o.foldlevel         = 10
vim.o.foldmethod        = "expr"
vim.o.foldexpr          = "nvim_treesitter#foldexpr()"
vim.o.swapfile          = false
vim.o.colorcolumn       = "80"
vim.o.incsearch         = true

vim.wo.wrap             = true
vim.textwidth           = 180
vim.wo.number           = true
vim.wo.cursorline       = true
vim.wo.signcolumn       = "yes"

vim.o.shiftwidth        = tabsize

vim.o.tabstop           = tabsize
vim.o.softtabstop       = tabsize
vim.o.autoindent        = true
vim.o.expandtab         = true

vim.g.matchparen_timeout = 1
vim.g.matchparen_insert_timeout = 1

-- Disable various builtin plugins in Vim that bog down speed
-- vim.g.loaded_matchparen        = 0
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1
vim.g.loaded_python3_provider  = 1
vim.g.loaded_python_provider   = 1

-- vim.g.cursorline_timeout = 500

-- neovide
if vim.fn.exists("g:neovide") then
  vim.o.guifont="SF Mono:13"
  vim.g.neovide_input_use_logo = true
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_vfx_mode = ""
end
