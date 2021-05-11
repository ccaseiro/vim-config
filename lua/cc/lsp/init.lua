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
	hover = use_sagalsp and 'Lspsaga hover_doc' or 'lua vim.lsp.buf.hover()',
	diagnostic_prev = use_sagalsp and 'Lspsaga diagnostic_jump_prev' or 'lua vim.lsp.diagnostic.goto_prev()',
	diagnostic_next = use_sagalsp and 'Lspsaga diagnostic_jump_next' or 'lua vim.lsp.diagnostic.goto_next()',
	diagnostic_line = use_sagalsp and 'Lspsaga show_line_diagnostics' or 'lua vim.lsp.diagnostic.show_line_diagnostics()'
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

	mapper('n', '[d', mappings.diagnostic_prev)
	mapper('n', ']d', mappings.diagnostic_next)
	mapper('n', '<leader>dp', mappings.diagnostic_prev)
	mapper('n', '<leader>dn', mappings.diagnostic_next)
	mapper('n', '<leader>dl', mappings.diagnostic_line)

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

