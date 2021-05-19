local lspconfig = require('lspconfig')
local wk = require("which-key")

wk.register({["<leader>l"] = {name = 'LSP'}})
wk.register({["<leader>li"] = {'<cmd>LspInfo<cr>', 'LspInfo'}})

vim.fn.sign_define("LspDiagnosticsSignError",
                   {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"})

local use_sagalsp = true

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>" .. result .. "<CR>", {noremap = true, silent = true})
end

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, 'filetype')

  mapper('n', 'gd', 'lua vim.lsp.buf.definition()')
  mapper('n', 'gD', 'lua vim.lsp.buf.declaration()')
  -- mapper('n', 'gr', 'lua vim.lsp.buf.references()')
  mapper('n', 'gr', 'Telescope lsp_references')
  mapper('n', 'gi', 'lua vim.lsp.buf.implementation()')

  mapper('n', '[d', 'CCLspDiagGotoPrev')
  mapper('n', ']d', 'CCLspDiagGotoNext')
  mapper('n', '<leader>dk', 'CCLspDiagGotoPrev')
  mapper('n', '<leader>dj', 'CCLspDiagGotoNext')
  mapper('n', '<leader>dp', 'CCLspDiagGotoPrev')
  mapper('n', '<leader>dn', 'CCLspDiagGotoNext')
  mapper('n', '<leader>dl', 'CCLspDiagShowLine')

  -- mapper('n', '<leader>lf', 'lua vim.lsp.buf.formatting()')
  wk.register({["<leader>lf"] = {'<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format'}})
  wk.register({["<leader>lr"] = {'<cmd>CCLspRename<cr>', 'Rename'}})
  wk.register({["<leader>la"] = {'<cmd>CCLspCodeActions<cr>', 'Code Action'}})

  if filetype ~= 'lua' then mapper('n', 'K', 'CCLspHoverDoc') end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

end

-- override defaults
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {on_attach = custom_attach})

require('cc/lsp/efm')
require('cc/lsp/lua')

-- Installation:
-- npm i -g pyright
lspconfig.pyright.setup {}

-- Install server with:
-- npm install -g typescript typescript-language-server
lspconfig.tsserver.setup {
  on_attach = function(client)
    custom_attach(client)
    client.resolved_capabilities.document_formatting = false;
  end
}

lspconfig.yamlls.setup({settings = {yaml = {schemas = {kubernetes = "/*.yaml"}}}})

