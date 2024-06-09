local opts = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
}

return {
  {
    "williamboman/mason.nvim",
    commit = "41e75af",
    opts   = opts,
    cmd    = "Mason",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "9453e3d",
    config = true,
  },
}
