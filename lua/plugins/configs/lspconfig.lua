local lsp = require("lspconfig")
local util = require("lspconfig/util")

local caps = vim.lsp.protocol.make_client_capabilities()
caps = require("cmp_nvim_lsp").update_capabilities(caps)

-- C/C++
lsp.clangd.setup{
  capabilities = caps,
}
-- Go
-- requires gopls
lsp.gopls.setup {
  capabilities = caps,
}
-- Terraform
-- requires terraform-ls
lsp.terraformls.setup {
  cmd = { "terraform-ls", "serve" },
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

-- requires pyright
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

-- JSON
-- lsp.jsonls.setup{
--   cmd = { "vscode-json-languageserver", "--stdio" },
--   capabilities = caps,
-- }

-- YAML
lsp.yamlls.setup{
  capabilities = caps,
}

-- Lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lsp.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {"vim"},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Rust
lsp.rls.setup {
  settings = {
    rust = {
      unstable_features = true,
      build_on_save     = false,
      all_features      = true,
    },
  },
}
