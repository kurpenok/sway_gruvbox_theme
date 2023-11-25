local base = require('plugins.configs.lspconfig')
local on_attach = base.on_attach
local capabilities = base.capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

return options
