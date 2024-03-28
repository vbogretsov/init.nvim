vim.api.nvim_create_user_command("PackerSetup", function()
  local present, packer = pcall(require, "packer")
  if present then
    print("packer already installed")
    return
  end
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

  print("downloading packer...")
  -- remove the dir before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    "--depth",
    "20",
    packer_path,
  })

  vim.cmd[[packadd packer.nvim]]
  present, packer = pcall(require, "packer")

  if present then
    print "packer downloaded"
  else
    error("couldn't download packer !\npacker path: " .. packer_path .. "\n" .. packer)
  end
end, {})

-- Add Packer commands because we are not loading it at startup
vim.cmd[[silent! command PackerClean lua require "plugins" require("packer").clean()]]
vim.cmd[[silent! command PackerCompile lua require "plugins" require("packer").compile()]]
vim.cmd[[silent! command PackerInstall lua require "plugins" require("packer").install()]]
vim.cmd[[silent! command PackerStatus lua require "plugins" require("packer").status()]]
vim.cmd[[silent! command PackerSync lua require "plugins" require("packer").sync()]]
vim.cmd[[silent! command PackerUpdate lua require "plugins" require("packer").update()]]
