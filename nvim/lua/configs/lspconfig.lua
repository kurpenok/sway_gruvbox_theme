local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "clangd",
  "cmake",
  "rust_analyzer",

  "html",
  "cssls",
  "tsserver",
  "vuels",

  "bashls",
  "jsonls",
  "yamlls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

local python_root_files = {
  "main.py",
  "setup.py",
  "setup.cfg",
  "pyproject.toml",
  "requirements.txt",
}
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern(python_root_files),
}

-- dotnet stuff
local pid = vim.fn.getpid()
lspconfig.omnisharp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(pid) },
}
