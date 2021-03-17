local lspconfig = require('lspconfig')
require('cc/lsp.lua')

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        kubernetes = "/*.yaml"
      }
    }
  }
  --on_attach = custom_attach
})

