local M = {}

M.load = function(module)
  ok, err = pcall(require, module)
  if not ok then
    error("error loading module " .. module .. "\n\n" .. err)
  end
end

M.init_plugins = function()
  if vim.g.plugins_init_called then
    return
  end
  vim.g.plugins_init_called = 1
  local runcmd = function()
    -- vim.cmd[[silent! MyPlugInit]]
    vim.cmd[[silent MyPlugInit]]
    vim.cmd[[doautocmd TextChanged]]
  end
  vim.defer_fn(runcmd, 1)
end

return M
