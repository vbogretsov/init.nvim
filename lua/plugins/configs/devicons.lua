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
  [".dockerignore"] = {
    icon = "",
    color = "#7fbbb3",
    name = ".dockerignore",
  },
  ["Dockerfile"] = {
    icon = "",
    color = "#7fbbb3",
    name = "dockerfile",
  },
  ["dockerfile"] = {
    icon = "",
    color = "#7fbbb3",
    name = "dockerfile",
  },
  ["docker-compose.yaml"] = {
    icon = "",
    color = "#7fbbb3",
    name = "dockerfile",
  },
  ["docker-compose.yml"] = {
    icon = "",
    color = "#7fbbb3",
    name = "dockerfile",
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
  ["properties"] = {
    icon = "",
    color = "#41535b",
    name = "jproperties",
  },
  ["Justfile"] = {
    icon = "",
    color = "#dbbc7f",
    name = "Justfile",
  },
  ["justfile"] = {
    icon = "",
    color = "#dbbc7f",
    name = "justfile",
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
  ["md"] = {
    icon = "",
    color = "#519aba",
    name = "md",
  },
  ["markdown"] = {
    icon = "",
    color = "#519aba",
    name = "markdown",
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
  ["toml"] = {
    icon = "",
    color = "#41535b",
    name = "Toml",
  },
  ["txt"] = {
    icon = "",
    color = "#89e051",
    cterm_color = "113",
    name = "Txt",
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
