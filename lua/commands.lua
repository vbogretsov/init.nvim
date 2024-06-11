vim.cmd([[command! F lua vim.lsp.buf.format({async = true})]])
vim.cmd(
  [[command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>]]
)

-- Install software
local deps = {
  "isort",
  "ruff",
  "clangd",
  "clang-format",
  "json-lsp",
  "yaml-language-server",
  "lua-language-server",
  "typescript-language-server",
  "gopls",
  "pyright",
  "deno",
}

vim.cmd(
  string.format("command! EnsureDeps MasonInstall %s", table.concat(deps, " "))
)
