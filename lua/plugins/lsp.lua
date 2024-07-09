local function setup()
  local lsp = require("lspconfig")
  local util = require("lspconfig/util")

  local caps = vim.lsp.protocol.make_client_capabilities()
  caps = require("cmp_nvim_lsp").default_capabilities(caps)

  -- C/C++
  lsp.clangd.setup({
    capabilities = caps,
  })

  -- Go
  -- requires gopls
  lsp.gopls.setup({
    capabilities = caps,
    filetypes = {
      "go",
      "gomod",
      "gowork",
      "gotmpl",
    },
    root_dir = util.root_pattern("go.mod", ".git"),
    single_file_support = true,
  })

  -- Terraform
  -- requires terraform-ls
  lsp.terraformls.setup({
    cmd = { "terraform-ls", "serve" },
    capabilities = caps,
  })

  -- Docker Compose
  lsp.docker_compose_language_service.setup({
    capabilities = caps,
  })

  -- Docker
  lsp.dockerls.setup({
    capabilities = caps,
  })

  -- Python
  local function detect_root()
    local venv = ".venv"

    local cwd = vim.fn.getcwd()
    local cp = vim.fs.joinpath(cwd, vim.fs.dirname(vim.fn.expand("%")))

    while #(cp) >= #(cwd) do
      if util.path.exists(vim.fs.joinpath(cp, venv)) then
        return cp
      end
      cp = vim.fs.dirname(cp)
    end

    return vim.fn.getcwd()
  end

  local function detect_python()
    local root = detect_root()
    local venv = vim.fs.joinpath(root, ".venv")
    if util.path.exists(venv) then
      return vim.fs.joinpath(venv, "bin", "python")
    end
    return "python"
  end

  lsp.pyright.setup({
    root_dir = detect_root,
    settings = {
      python = {
        venvPath = "",
        pythonPath = detect_python(),
        analysis = {
          autoSearchPaths = true,
        },
      },
    },
    capabilities = caps,
  })

  -- Python
  --[[ lsp.ruff_lsp.setup({
    single_file_support = true,
    capabilities = caps,
  }) ]]

  --[[ lsp.ruff.setup({
    capabilities = caps,
  }) ]]

  lsp.tsserver.setup({
    capabilities = caps,
  })

  -- JSON
  lsp.jsonls.setup({
    cmd = { "vscode-json-language-server", "--stdio" },
    init_options = {
      provideFormatter = true,
    },
    capabilities = caps,
  })

  -- YAML
  lsp.yamlls.setup({
    capabilities = caps,
  })

  -- Lua
  lsp.lua_ls.setup({
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if
          vim.loop.fs_stat(path .. "/.luarc.json")
          or vim.loop.fs_stat(path .. "/.luarc.jsonc")
      then
        return
      end
      client.config.settings.Lua =
          vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
          })
    end,
    settings = {
      Lua = {},
    },
  })

  -- rust
  lsp.rust_analyzer.setup({
    settings = {
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
    capabilities = caps,
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    commit = "92166b8",
    lazy = true,
    config = setup,
  },
  {
    "nvimtools/none-ls.nvim",
    commit = "8691504",
    event = "BufReadPost",
    dependencies = { "none-ls-extras.nvim" },

    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.completion.spell,
          require("none-ls.diagnostics.eslint"),
          require("none-ls.formatting.yq"),
          require("none-ls.formatting.ruff_format"),
          require("none-ls.formatting.rustfmt"),
          require("none-ls.formatting.eslint"),
        },
      })
    end,
  },
  {
    "nvimtools/none-ls-extras.nvim",
    name = "none-ls-extras.nvim",
    commit = "336e84b",
    event = "BufReadPost",
  },
}
