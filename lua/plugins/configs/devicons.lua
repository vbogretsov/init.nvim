local devicons = require("nvim-web-devicons")

return devicons.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  ["go.mod"] = {
    icon = "",
    color = "#519aba",
    name = "gomod",
  },
  ["go.sum"] = {
    icon = "",
    color = "#519aba",
    name = "gosum",
  },
  ["Dockerfile"] = {
    icon = "",
    color = "#519aba",
    name = "Dockerfile"
  },
  ["makefile"] = {
    icon = "",
    color = "#dfa000",
    name = "Makefile"
  },
  ["make"] = {
    icon = "",
    color = "#dfa000",
    name = "Makefile"
  },
  ["Makefile"] = {
    icon = "",
    color = "#dfa000",
    name = "Makefile"
  },
  ["markdown"] = {
    icon = "",
    color = "#519aba",
    name = "Markdown",
  },
  ["py"] = {
    icon = "",
    color = "#519aba",
    cterm_color = "61",
    name = "Py",
  },
  ["pyc"] = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Pyc",
  },
  ["pyd"] = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Pyd",
  },
  ["pyo"] = {
    icon = "",
    color = "#519aba",
    cterm_color = "67",
    name = "Pyo",
  },
  ["rst"] = {
    icon = "",
    color = "#519aba",
    name = "rst",
  },
  ["tf"] = {
    -- icon = "",
    icon = "",
    -- icon = "",
    -- icon = "",
    -- icon = "",
    -- icon = "",
    -- icon = "",
    -- icon = "ﭨ",
    color = "#df69ba",
    name = "terraform",
  },
  ["tfvars"] = {
    icon = "",
    color = "#df69ba",
    name = "tfvars",
  },
  ["sh"] = {
    icon = "",
    color = "#83c092",
    name = "Shell"
  },
  ["zsh"] = {
    icon = "",
    color = "#83c092",
    name = "Zsh"
  },
 },
}
