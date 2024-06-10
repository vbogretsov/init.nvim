vim.cmd([[command! Fmt lua vim.lsp.buf.format({async = true})]])
vim.cmd([[command! -nargs=1 -complete=help H :enew | :set buftype=help | :h <args>]])
