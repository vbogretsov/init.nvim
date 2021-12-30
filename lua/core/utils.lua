local M = {}

M.load = function(module)
  ok, err = pcall(require, module)
  if not ok then
    error("error loading module " .. module .. "\n\n" .. err)
  end
end

return M
