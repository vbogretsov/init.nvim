return {
  {
    "nvim-telescope/telescope.nvim",
    commit = "b4da76b",
    cmd = "Telescope",
    config = require("plugins.nav.telescope").setup,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    commit = "1f08ed6",
    build = "make",
    lazy = true,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    commit = "6e51d7d",
    lazy = true,
  },
}
