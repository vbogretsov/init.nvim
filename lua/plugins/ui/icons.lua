local opts = {
  override = {
    ["Dockerfile"] = { icon = "", color = "#519aba", name = "Dockerfile" },
    ["d2"] = { icon = "󱁉", color = "#83c092", name = "d2" },
    ["excalidraw"] = { icon = "󱁉", color = "#83c092", name = "d2" },
    ["drawio"] = { icon = "󱁉", color = "#f2a622", name = "d2" },
    ["excalidraw.png"] = { icon = "󱁉", color = "#83c092", name = "d2" },
    ["py"] = { icon = "", color = "#519aba", cterm_color = "61", name = "Py" },
    ["pyc"] = { icon = "", color = "#519aba", cterm_color = "67", name = "Pyc" },
    ["pyd"] = { icon = "", color = "#519aba", cterm_color = "67", name = "Pyd" },
    ["pyo"] = { icon = "", color = "#519aba", cterm_color = "67", name = "Pyo" },
    ["rst"] = { icon = "", color = "#519aba", name = "rst"},
    ["justfile"] = { icon = "", color = "#83c092", name = "Justfile" },
    ["sh"] = { icon = "", color = "#83c092", name = "shell" },
    ["zsh"] = { icon = "", color = "#83c092", name = "zsh" },
    ["docker-compose.yml"] = { icon = "", color = "#458ee6", cterm_color = "68", name = "Dockerfile" },
    ["docker-compose.yaml"] = { icon = "", color = "#458ee6", cterm_color = "68", name = "Dockerfile" },
    [".dockerignore"] = { icon = "", color = "#458ee6", cterm_color = "68", name = "Dockerfile" },
    ["dockerfile"] = { icon = "", color = "#519aba", cterm_color = "68", name = "Dockerfile" },
    ["tf"] = { icon = "", color = "#df69ba", name = "terraform" },
    ["tfvars"] = { icon = "", color = "#df69ba", name = "tfvars" },
    ["toml"] = { icon = "", color = "#83c092", name = "toml" },
  },
}

return { opts = opts }

