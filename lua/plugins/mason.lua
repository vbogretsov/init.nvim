-- Not covered dependencies:
-- - [not used] docker-language-server (https://github.com/docker/docker-language-server)
-- - go install github.com/shurcooL/markdownfmt@latest

local packages = {
  "clang-format",
  "clangd",
  "gopls",
  "lua-language-server",
  "json-lsp",
  "just-lsp",
  "basedpyright",
  "rust-analyzer",
  "rustfmt",
  "html-ls",
  "ruff",
  "stylua",
  "terraform-ls",
  "typescript-language-server",
  "sqruff",
  "yaml-language-server",
  "yamlfmt",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(packages, " "))
end, {
  desc = "Install required packages",
})

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
    tag = "v2.0.0",
    opts = opts,
    lazy = false,
  },
}
