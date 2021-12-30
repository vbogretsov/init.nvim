require("telescope").setup{
  defaults = {
    vimgrep_arguments = {
     "rg",
     "--color=never",
     "--no-heading",
     "--with-filename",
     "--line-number",
     "--column",
     "--smart-case",
    },
    prompt_prefix = "   ",
    layout_strategy = "vertical",
    layout_config = {
      height = 0.9,
      mirror = false,
      prompt_position = "bottom",
    },
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "ignore_case",
    }
  }
}

require("telescope").load_extension("fzf")