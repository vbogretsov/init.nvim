-- vim.cmd([[command! F lua vim.lsp.buf.format({async = true})]])
vim.cmd([[command! F lua require("conform").format({ bufnr = 0 })]])

vim.cmd(
  [[command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>]]
)
