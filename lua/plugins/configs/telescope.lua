local previewers = require("telescope.previewers")

local Job = require("plenary.job")

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end

require("telescope").setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    preview = {
      filesize_limit = 0.5,
    },
    vimgrep_arguments = {
     "rg",
     "--color=never",
     "--no-heading",
     "--with-filename",
     "--line-number",
     "--column",
     "--smart-case",
     "--glob=!.venv/*",
     "--glob=!.git/*",
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
  pickers = {
    find_files = {
      find_command = {
        "fdfind",
        "--type",
        "f",
        "--strip-cwd-prefix",
        "--hidden",
        "--exclude",
        ".git",
        "--exclude",
        ".venv",
        "--exclude",
        "__pycache__",
        "--exclude",
        "*.avro",
        "--exclude",
        "*.jsonl",
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "ignore_case",
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        prompt_prefix = "   ",
        layout_strategy = "vertical",
        layout_config = {
          height = 0.4,
          mirror = false,
          prompt_position = "bottom",
        },
      }
    },
  }
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
