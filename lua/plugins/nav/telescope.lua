local opts = {
  defaults = {
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
      "--glob=!node_modules/*",
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
        "fd",
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
        "node_modules",
        "--exclude",
        "*.avro",
        "--exclude",
        "*.jsonl",
        "--exclude",
        "node_modules",
        "--exclude",
        "dist",
      },
    },
  },
  extensions = {
    ["fzf"] = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "ignore_case",
    },
  },
}

local function make_previewer(job, previewers)
  return function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    job:new({
      command = "file",
      args = { "--mime-type", "-b", filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], "/")[1]
        if mime_type == "text" then
          previewers.buffer_previewer_maker(filepath, bufnr, opts or {})
        else
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
          end)
        end
      end,
    }):sync()
  end
end

local function setup()
  local previewers = require("telescope.previewers")
  local telescope = require("telescope")
  local job = require("plenary.job")
  local new_maker = make_previewer(job, previewers)

  vim.tbl_deep_extend("force", opts, {
    defaults = {
      preview_file_maker = new_maker,
    },
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({
          prompt_prefix = "   ",
          layout_strategy = "vertical",
          layout_config = {
            height = 0.4,
            mirror = false,
            prompt_position = "bottom",
          },
        }),
      },
    },
  })

  telescope.setup(opts)
  telescope.load_extension("fzf")
  telescope.load_extension("ui-select")
end

return { setup = setup }
