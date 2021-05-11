local lspconfig = require('lspconfig')

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)


local use_sagalsp = true

local mappings = {
	hover = use_sagalsp and 'Lspsaga hover_doc' or 'lua vim.lsp.buf.hover()'
}

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>" .. result .. "<CR>", {noremap = true, silent = true})
end

local custom_attach = function()
	local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

	mapper('n', 'gd', 'lua vim.lsp.buf.definition()')
	mapper('n', 'gD', 'lua vim.lsp.buf.declaration()')
	mapper('n', 'gr', 'lua vim.lsp.buf.references()')
	mapper('n', 'gi', 'lua vim.lsp.buf.implementation()')

	if filetype ~= 'lua' then
    mapper('n', 'K', mappings.hover)
  end
end

require('cc/lsp/lua').setup(custom_attach)

-- Install server with:
-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{
  on_attach = custom_attach,
}


lspconfig.yamlls.setup({
  on_attach = custom_attach,
  settings = {
    yaml = {
      schemas = {
        kubernetes = "/*.yaml"
      }
    }
  }
})

