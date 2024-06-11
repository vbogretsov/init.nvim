local gitconflict_opts = {
  default_mappings = {
    ours = "o",
    theirs = "t",
    none = "0",
    both = "b",
    next = "n",
    prev = "p",
  },
}

return {
  {
    "akinsho/git-conflict.nvim",
    tag = "v2.0.0",
    cmd = "GitConflictDetected",
    opts = gitconflict_opts,
  },
  {
    "lewis6991/gitsigns.nvim",
    commit = "6ef8c54",
    event = "BufRead",
    config = true,
  },
}
