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
    tag = "v1.10.0",
    opts = opts,
    cmd = "Mason",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "9453e3d",
    config = true,
    event = "BufReadPost",
  },
}
