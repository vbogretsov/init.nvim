local function setup()
  require("peek").setup({
    auto_load = true,
    close_on_bdelete = true,
    syntax = true,
    theme = "light",
    update_on_change = true,
    app = "webview",
    filetype = { "markdown" },
    throttle_at = 200000,
    throttle_time = "auto",
  })

  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end

local mason, _ = pcall(require, "mason")
if not mason then
  return { }
end

return {
  {
    "toppair/peek.nvim",
    commit = "5820d93",
    build = "deno task --quiet build:fast",
    config = setup,
    cmd = "PeekOpen",
  },
}
