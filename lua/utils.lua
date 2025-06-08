local M = {}

M.root_dir = function(filenames)
  return function(bufnr, on_dir)
    local filepath = vim.api.nvim_buf_get_name(bufnr)
    local dir = vim.fn.fnamemodify(filepath, ":p:h")

    while dir ~= "/" do
      for _, filename in ipairs(filenames) do
        local candidate = dir .. "/" .. filename
        if vim.fn.filereadable(candidate) == 1 or vim.fn.isdirectory(candidate) == 1 then
          on_dir(dir)
          return
        end
      end

      local parent = vim.fn.fnamemodify(dir, ":h")
      if parent == dir then
        break
      end
      dir = parent
    end
  end
end

return M
