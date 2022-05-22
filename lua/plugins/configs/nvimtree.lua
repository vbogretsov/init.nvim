vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

vim.g.nvim_tree_git_hl          = 1
vim.g.nvim_tree_special_files   = {}

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged  = "✗",
    staged    = "✓",
    unmerged  = "",
    renamed   = "➜",
    untracked = "",
    deleted   = "",
    ignored   = "◌"
  },
  folder = {
    arrow_open    = "",
    arrow_closed  = "",
    default       = "",
    open          = "",
    empty         = "",
    empty_open    = "",
    symlink       = "",
    symlink_open  = "",
  },
}

require("nvim-tree").setup {
  disable_netrw   = true,
  hijack_netrw    = true,
  auto_close      = true,
  renderer        = {
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      ".coverage",
      ".git",
      "node_modules",
      ".cache",
      ".idea",
      "__pycache__",
      "*.pyc",
    },
  },
  view = {
    width = 40,
    hide_root_folder = true,
  }
}
