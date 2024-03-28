local lsp = require("lspconfig")
local util = require("lspconfig/util")

local caps = vim.lsp.protocol.make_client_capabilities()
caps = require("cmp_nvim_lsp").default_capabilities(caps)

-- C/C++
lsp.clangd.setup{
  capabilities = caps,
}
-- Go
-- requires gopls
lsp.gopls.setup {
  capabilities = caps,
  filetypes = {
    "go",
    "gomod",
    "gowork",
    "gotmpl",
  },
  root_dir = util.root_pattern("go.mod", ".git"),
  single_file_support = true
}
-- Terraform
-- requires terraform-ls
lsp.terraformls.setup {
  cmd = { "terraform-ls", "serve" },
  capabilities = caps,
}

-- Docker Compose
lsp.docker_compose_language_service.setup{
  capabilities = caps,
}

-- Docker
lsp.dockerls.setup{
  capabilities = caps,
}

-- Python
local function detect_python()
  local venvdir = ".venv"
  local path = util.path
  local cwd = vim.fn.getcwd()
  if path.exists(path.join(cwd, venvdir)) then
    return path.join(cwd, venvdir, "bin", "python")
  end
  return "python"
end

lsp.pyright.setup {
  root_dir = function(startpath)
    return vim.fn.getcwd()
  end,
  settings = {
    python = {
      venvPath = "",
      pythonPath = detect_python(),
      analysis = {
        autoSearchPaths = true,
      }
    },
  },
  capabilities = caps,
}

lsp.tsserver.setup{
  capabilities = caps,
}

-- JSON
lsp.jsonls.setup {
  cmd = { "vscode-json-languageserver", "--stdio" },
  init_options = {
    provideFormatter = true
  },
  capabilities = caps,
}

-- YAML
lsp.yamlls.setup{
  capabilities = caps,
}

-- Lua
lsp.lua_ls.setup {}

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
        enable = true
      },
    }
  },
  capabilities = caps,
})
