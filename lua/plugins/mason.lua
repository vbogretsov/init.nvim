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
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "9453e3d",
    config = true,
    event = "BufAdd",
    dependencies = { "neovim/nvim-lspconfig" },
  },
}
