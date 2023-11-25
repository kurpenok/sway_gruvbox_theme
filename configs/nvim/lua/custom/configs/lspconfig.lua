local base = require('plugins.configs.lspconfig')
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

lspconfig.clangd.setup {
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'python'},
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'rust'},
  root_dir = util.root_pattern('Cargo.toml'),
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
