local plugpath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(plugpath)

vim.api.nvim_create_user_command("PluginSetup", function()
  local present, _ = pcall(require, "lazy")
  if present then
    print("lazy is already installed")
    return
  end

  print("downloading lazy.nvim...")
  vim.fn.delete(plugpath, "rf")
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    plugpath,
  })

  print("download complete, run :checkhealth lazy for check")
end, {})

local ok, lazy = pcall(require, "lazy")
if not ok then
  print("lazy.nvim is not installed, run command PluginSetup to install it")
  return
end

local opts = {
  change_detection = {
    enabled = false,
    notify = false,
  },
  install = {
    missing = false,
    colorscheme = { "everforest" },
  },
}

lazy.setup("plugins", opts)