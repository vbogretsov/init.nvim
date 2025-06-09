return {
  {
    "akinsho/git-conflict.nvim",
    tag = "v2.1.0",
    cmd = "GitConflictDetected",
    opts = require("plugins.git.gitconflict").opts,
  },
  {
    "lewis6991/gitsigns.nvim",
    commit = "d0f90ef",
    event = "VeryLazy",
    config = true,
  },
}
